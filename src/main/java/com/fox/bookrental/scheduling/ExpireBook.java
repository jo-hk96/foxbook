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
		// 초-분-시-일-월-요일
		// 0   0  0  *  *  * 
		//설정 시간마다 로직 반복
		@Scheduled(cron = "0 */10 * * * *") 
		public void checkBooks() throws ParseException {
			// 대여 기록중 반납되지않은 null인 모든 기록 조회
			List<rentalDTO> rentalBookList = rentalMapper.notReturnsBooks();
			
			System.out.println("[10분당조회 총 사용자 대여 도서 갯수 조회]");
			System.out.println("총 조회된 책 개수: " + rentalBookList.size());
			//각 대여 기록을 확인 Yri_rtdate를 date 형식으로 변환
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			//현재시간
			Date currentDate = new Date();
			//rentalBookList의 리스트를 꺼내 rental 변수에 담음
			for(rentalDTO rental : rentalBookList) {
				
				//String yri_rtdate 를 date 형식으로 변환
				Date rentalDate = dateFormat.parse(rental.getYri_rtdate());
				
				//현재 시간 - 대여시간 = 대여중인시간
				//ex) (2025 - 09 - 01) - (2025 - 08 - 20)  
				long diffInMillies = currentDate.getTime() - rentalDate.getTime();
				
				//일 시 분 초 밀리초/ 밀리초로 바꾸기위한 계산
				//계산하기위한 젤 큰 단위가 앞에 옴 ex) 7일 계산시 7
				// long 타입을 붙힌 기준으로 뒤 계산식이 타입의 맞게 산출 
				//ex) 30L일 * 24시간 * 60분 * 60초 * 1000L = 30일을 밀리초로 계산
				// 5분 : 5 * 60 * 1000L;
				// 7일 : 7 * 24 * 60 * 60 * 1000L;
				long fiveMinutesInMillies = 7 * 24 * 60 * 60 * 1000L;
				System.out.println("대여 시간: " + rental.getYri_rtdate() + " 남은 시간:" + diffInMillies);
				
				// 7일 보다 지금까지 대여한 시간이 같거나 크면 로직실행
				if(diffInMillies >= fiveMinutesInMillies) {
				
				// 5분이 지날시 반납으로 업데이트
				rentalMapper.updateRental(rental);
				System.out.println(rental.getYbi_idx()+ "5분 자동반납" );
					
					}
				}
			}
		}
