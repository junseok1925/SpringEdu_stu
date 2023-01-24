package kr.board.entity;

import lombok.Data;

@Data //- lombok API - 코드 다이어트 API 자동으로 getter,setter 생성
public class Board {
	private int idx; //번호
	private String title;	//제목
	private String content;	//내용
	private String writer;	//작성자
	private String indate;	//작성일	
	private int count;	//조회수
	//setter, getter
	
}

