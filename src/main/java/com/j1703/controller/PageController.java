package com.j1703.controller;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.j1703.service.AnchorService;
import com.j1703.service.ClassifyService;
import com.j1703.vo.Anchor;
import com.j1703.vo.Classify;



@Controller
public class PageController {
	

	@Autowired
	private AnchorService anchorService;
	
	@Autowired
	private ClassifyService classifyService;
	


	@RequestMapping(value = "classifyPage.do")
	public String classifyPage(Model model) {
		List<Classify> addClassify = classifyService.getAllClassify();
		model.addAttribute("addClassify", addClassify);
		return "classifyPage";
	}
	
	@RequestMapping(value = "simplePage.do")
	public String simplePage(Model model,Classify classify) {
		List<Anchor> liveAnchor = anchorService.getSimpleClassify(classify.getId());
		model.addAttribute("liveAnchor", liveAnchor);
		return "totalPage";
	}
	
	
	@RequestMapping(value = "index.do")
	public String indexPage(Model model) {
		Anchor indexAnchor = anchorService.indexPage();
		model.addAttribute("anchor", indexAnchor);
		return "index";
	}
	
	@RequestMapping(value = "totalPage.do")
	public String totalPage(Model model) {
		List<Anchor> liveAnchor = anchorService.totalPage();
		model.addAttribute("liveAnchor", liveAnchor);
		return "totalPage";
	}
	
	
	@RequestMapping(value = "livePage.do")
	public String livePage(Model model,Integer liveCode) {
		Anchor anchor = anchorService.livePage(liveCode);
		model.addAttribute("anchor", anchor);
		return "livePage";
	}
	
	@RequestMapping(value = "blog.do")
	public String blog(Model model) {
		return "blog";
	}
	
	
	@RequestMapping(value = "searchAnchor.do")
	public String searchAnchor(Model model,String keyWords) {
		List<Anchor> liveAnchor = anchorService.searchAnchor(keyWords);
		model.addAttribute("liveAnchor", liveAnchor);
		return "totalPage";
	}
	

	
}
