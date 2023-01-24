package kr.board.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//pojo
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper mapper;
	// /boardLIst.do
	// HandlerMapping
	
	@RequestMapping("/boardList.do")
	public String boardList(Model model) {
		
		List<Board> list = mapper.getLists();
		model.addAttribute("list2",list);
		return "boardList"; 	// /WEB-INF/views/boardList.jsp -> forward
	}
	
	@GetMapping("/boardForm.do")
	public String boardForm() {
		return "boardForm"; 	// /WEB-INF/views/boardForm.jsp -> forward : 데이터를 가지고 이동
	}
	
	@PostMapping("/boardInsert.do")
	public String boardInsert(Board vo) { //title, content, writer => 파라메터수집(Board)
		mapper.boardInsert(vo);
		return "redirect:/boardList.do"; // redirect : 페이지로만 이동
	}
	
	@GetMapping("/boardContent.do")
	public String boardContent(@RequestParam("idx") int idx, Model model) { //?idx=6
		Board vo = mapper.boardContent(idx);
		//조회수증가
		mapper.boardCount(idx);
		model.addAttribute("vo",vo); //${vo.idx}
		return "boardContent"; //boardContent.jsp
	}
	
	@GetMapping("/boardDelete.do/{idx}")
	public String boardDelete(@PathVariable("idx") int idx) {	//?idx=6
		mapper.boardDelete(idx); //삭제
		return "redirect:/boardList.do";
	}
	@GetMapping("/boardUpdateForm.do/{idx}")
	public String boardUpdateForm(@PathVariable("idx") int idx, Model model) {
		Board vo = mapper.boardContent(idx);
		model.addAttribute("vo",vo); //${vo.idx}
		return"boardUpdate"; //boardUpdate.jsp
	}
	@PostMapping("/boardUpdate.do")
	public String boardUpdate(Board vo) { //idx, title, content
		mapper.boardUpdate(vo); //수정
		return "redirect:/boardList.do";
	}
	
}
