package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.CompanyBoardVO;
import com.example.domain.CompanyVO;
import com.example.domain.Criteria;
import com.example.domain.ComapnyPageDTO;
import com.example.service.CompanyService;
import com.example.service.CompanyBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/company/*")
@AllArgsConstructor
public class CompanyController {
   
   private CompanyService service;
   private CompanyBoardService boardservice;
   
   
   

   
   
   @GetMapping("/companyList")
   public void companyList(Criteria cri, Model model) {
      log.info("companyList: "+cri);
      model.addAttribute("companyList",service.getList(cri));
      
      int total = service.getTotal(cri);
            
            log.info("total: "+total);
            
            model.addAttribute("pageMaker", new ComapnyPageDTO(cri,total));
   }
   
   @GetMapping("/company")//3.검색
   public void company(@RequestParam("cno") Long cno, @ModelAttribute("cri") Criteria cri, Model model) {
      log.info("/company");
      model.addAttribute("list", boardservice.getList(cri, cno));
      model.addAttribute("pageMaker",new ComapnyPageDTO(cri,223));
      model.addAttribute("company", service.get(cno));
      
      int total = boardservice.getTotal(cri);
      
      log.info("total: "+total);
      
      model.addAttribute("pageMaker", new ComapnyPageDTO(cri,total));
   }
   
   
   @GetMapping("/companyBoard")
   public void companyBoard(@RequestParam("bno") Long bno, @RequestParam("cno") Long cno, Criteria cri,  Model model) {
	   log.info("/companyBoard");
	   model.addAttribute("c_board", boardservice.get(bno));
	   model.addAttribute("list", boardservice.getList(cri, cno));
	   model.addAttribute("pageMaker",new ComapnyPageDTO(cri,223));
	   model.addAttribute("company", service.get(cno));
   }
   
   @GetMapping("/register")
   public void register(@RequestParam("cno") Long cno,  Model model) {
      log.info("/register");
      model.addAttribute("company", service.get(cno));
      
   }
   
   @PostMapping("/register")//2.입력
   public String register(CompanyBoardVO c_board, @RequestParam("cno") Long cno, RedirectAttributes rttr, Model model) {
      
      log.info("register: " + c_board);
      boardservice.register(c_board);
      rttr.addFlashAttribute("result", c_board.getBno());
      model.addAttribute("company", service.get(cno));
      return "redirect:/company/company?cno="+cno;
   }
   
   @GetMapping("/modify")
   public void modify (@RequestParam("bno") Long bno, Model model) {
      log.info("/modify");
      model.addAttribute("c_board", boardservice.get(bno));
      
   }
   
   
   @PostMapping("/modify")//4.수정
   public String modify(CompanyBoardVO c_board, @RequestParam("bno") Long bno, RedirectAttributes rttr, Model model) {
      log.info("modify:"+c_board);
      if(boardservice.modify(c_board)) {
         rttr.addFlashAttribute("result", "success");
      }
      
      return "redirect:/company/companyBoard?bno="+bno+"&cno="+ c_board.getCno();
   }
   
   
   @RequestMapping(value="/remove",
               method= {RequestMethod.GET,RequestMethod.POST})
   public String remove(@RequestParam("bno")Long bno, Criteria cri, @RequestParam("cno") Long cno, RedirectAttributes rttr,Model model) {
      log.info("remove...."+bno);
      model.addAttribute("list", boardservice.getList(cri, cno));
      model.addAttribute("company", service.get(cno));
      if(boardservice.remove(bno)) {
         rttr.addFlashAttribute("result", "success");
      }
      
////      rttr.addAttribute("pageNum",cri.getPageNum());
////      rttr.addAttribute("amount",cri.getAmount());
////      
////      rttr.addAttribute("type",cri.getType());
////      rttr.addAttribute("keyword",cri.getKeyword());
//      
      return"redirect:/company/company?cno="+cno;
   }
//   
//   @GetMapping("/list")//3.검색
//   public void list(@RequestParam("cno") Long cno, @ModelAttribute("cri") Criteria cri, Model model) {
//      log.info("/list"+cri);
//      model.addAttribute("list", boardservice.getList(cri));
//      
//   }
   
   
   //   
//   @GetMapping("/list")
//   public void list(Criteria cri, Model model,@RequestParam("cno") Long cno) {
//      
//      log.info("list: "+cri);
//      model.addAttribute("list",boardservice.getList(cri, cno));
//      model.addAttribute("pageMaker",new PageDTO(cri,223));
//      
//      int total = boardservice.getTotal(cri);
//      
//      log.info("total: "+total);
//      
//      model.addAttribute("pageMaker", new PageDTO(cri,total));
//   }
//   
   
//   @GetMapping("/list")//1.목록 조회
//   public void list(Model model) {
//      log.info("list");
//      model.addAttribute("list",boardservice.getList());
//   }
   


   
//   @GetMapping("/get")//3.검색
//   @GetMapping({"/get","/modify"})//3.검색
   public void get(@RequestParam("cno") Long cno, @ModelAttribute("cri") Criteria cri, Model model) {
      log.info("/get");
      model.addAttribute("company", service.get(cno));
   }
//   @PostMapping("/modify")//4.수정
   public String modify(CompanyVO company, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
      log.info("modify:"+company);
      
      if(service.modify(company)) {
         rttr.addFlashAttribute("result", "success");
      }
      
//      rttr.addAttribute("pageNum",cri.getPageNum());
//      rttr.addAttribute("amount",cri.getAmount());
//      
//      rttr.addAttribute("type",cri.getType());
//      rttr.addAttribute("keyword",cri.getKeyword());
      
      
      
      return "redirect:/company/company"+cri.getListLink();
      }
      
//   @PostMapping("/remove")//5.삭제
//   @GetMapping("/remove")//5.삭제
}

