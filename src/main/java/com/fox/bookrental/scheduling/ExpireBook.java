package com.fox.bookrental.scheduling;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.fox.bookrental.domain.rentalDTO;
import com.fox.bookrental.mapper.RentalMapper;

@Component
public class ExpireBook {
	private final RentalMapper rentalMapper;
	
	
	public ExpireBook(RentalMapper rentalMapper) {
		this.rentalMapper = rentalMapper;
	}
		//매일 새벽 3시 :7일 초과 도서 자동 반납
		//0 0 0 * * * : 초 분 시
		@Scheduled(cron = "0 0 0 * * *")
		public void checkBooks() throws ParseException {
			// 대여 기록중 반납되지않은 null인 모든 기록 조회
			List<rentalDTO> rentalBookList = rentalMapper.notReturnsBooks();
			
			//각 대여 기록을 확인 Yri_rtdate를 date 형식으로 변환
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:MI:SS");
			Date currentDate = new Date();
			for(rentalDTO rental : rentalBookList) {
				Date rentalDate = null;
				
				rentalDate = dateFormat.parse(rental.getYri_rtdate());
				
				long diffInMillies = currentDate.getTime() - rentalDate.getTime();
				long diffInDays = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
			//대여일이 7일이상일경우
			if(diffInDays >= 7) {
				
			// 7일 초과 시 반납으로 업데이트
			rentalMapper.updateRental(rental);
			System.out.println(rental.getYbi_idx() + "7일경과 자동반납");
			}
		}
	}
}
