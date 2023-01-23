package kr.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.board.entity.Board;
@Mapper //Mybatis API

//Board 클래스를 참조하는 getlists라는 이름의 메서드 List를 생성.
public interface BoardMapper {
	public List<Board> getLists(); //전체리스트를 가져온다
	public void boardInsert(Board vo);
	
	
	
}
