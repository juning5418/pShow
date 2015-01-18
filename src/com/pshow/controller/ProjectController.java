package com.pshow.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pshow.pojo.Project;
import com.pshow.service.ProjectService;
import com.pshow.utils.DwzAjaxDone;
import com.pshow.utils.PSHOW;
import com.pshow.utils.StringUtil;

@Controller
@RequestMapping("/")
public class ProjectController extends DwzAjaxDone {

	@Autowired
	private ProjectService projectService;

	// 项目列表
	@RequestMapping("project_list")
	public String projectList(Model model, HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String projectName = request.getParameter("projectName");// 项目名称
		String pgNum = request.getParameter("pageNum");// 跳转页
		String orderField = request.getParameter("orderField");// 排序字段
		String orderDirection = request.getParameter("orderDirection");// 排序方式
		int pageNum = 1;
		if (!StringUtil.isNullOrEmpty(pgNum)) {
			pageNum = Integer.parseInt(pgNum);
		}
		if (!StringUtil.isNullOrEmpty(projectName)) {
			map.put("projectName", projectName);
			request.setAttribute("projectName", projectName);
		}
		if (!StringUtil.isNullOrEmpty(orderField)) {
			map.put("orderField", orderField);
			request.setAttribute("orderField", orderField);
		}
		if (!StringUtil.isNullOrEmpty(orderDirection)) {
			map.put("orderDirection", orderDirection);
			request.setAttribute("orderDirection", orderDirection);
		}
		int totalCount = projectService.queryProjectCount(map);

		if (totalCount > 0) {
			if (!StringUtil.isNullOrEmpty(orderField)) {
				map.put("orderField", orderField);
				request.setAttribute("orderField", orderField);
			}
			if (!StringUtil.isNullOrEmpty(orderDirection)) {
				map.put("orderDirection", orderDirection);
				request.setAttribute("orderDirection", orderDirection);
			}
			map.put("start", (pageNum - 1) * 20);
			map.put("limit", 20);
			model.addAttribute("proList", projectService.queryProject(map));
		}
		List<Project> list = projectService.queryProject(map);
		for (Project project : list) {
			System.out.println(project.getProjectName()+"----------"+project.getId());
		}
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("totalCount", totalCount);
		return "/jsp/project_list";
	}

	// 跳转至修改页面
	@RequestMapping(value = "edit_project", method = RequestMethod.GET)
	public String toEditProject(@ModelAttribute("project") Project project,
			Model model) {
		model.addAttribute("project", projectService.loadProject(project));
		return "/jsp/edit_project";
	}

	// 修改项目
	@RequestMapping(value = "edit_project", method = RequestMethod.POST)
	public String editProject(@ModelAttribute("project") Project project,
			Model model) {
		if (!projectService.editProject(project)) {
			return ajaxForwardError("修改失败");
		}
		return ajaxForwardSuccess("修改成功!");
	}

	// 删除项目
	@RequestMapping("del_project")
	public String delProject(@RequestParam String ids) {
		Project project = new Project();
		project.setProjectNo(ids);
		if (!projectService.delProject(project)) {
			return ajaxForwardError("删除失败");
		}
		return ajaxForwardSuccess("删除成功!");
	}

	@RequestMapping(value = "add_project", method = RequestMethod.GET)
	public String toAddProject() {
		return "/jsp/add_project";
	}

	// 新增项目
	@RequestMapping(value = "add_project", method = RequestMethod.POST)
	public String addProject(@ModelAttribute("project") Project project,
			Model model) {
		if (!projectService.addProject(project)) {
			return ajaxForwardError("增加失败");
		}
		return ajaxForwardSuccess("增加成功!");
	}

	@RequestMapping("export_project_list")
	public String export(HttpServletResponse response) {
		List<Project> list = projectService
				.queryProject(new HashMap<String, Object>());
		response.reset();// 清空输出流
		response.setHeader("Content-disposition",
				"attachment; filename=project.xls");// 设定输出文件头
		response.setContentType("application/msexcel");// 定义输出类型
		HSSFWorkbook wbook = new HSSFWorkbook();
		try {
			OutputStream os = response.getOutputStream();// 从响应里获取输出流
			HSSFSheet sheet = wbook.createSheet("项目");// 创建工作表
			sheet.setDefaultColumnWidth(20);// 设置表格默认宽度
			HSSFCellStyle style = wbook.createCellStyle();// 创建表格样式
			style.setVerticalAlignment(CellStyle.ALIGN_CENTER);// 设置文本居中
			HSSFRow row = sheet.createRow(0);// 表格标题行
			HSSFCell cell = null;
			for (int i = 0; i < PSHOW.PROJECT_ARRAY.length; i++) {
				cell = row.createCell(i);// 给这一行添加一个表格
				cell.setCellStyle(style);
				cell.setCellValue(PSHOW.PROJECT_ARRAY[i]);// 设置表格内容
			}
			for (int i = 0; i < list.size(); i++) {
				int j = 0;
				row = sheet.createRow(i + 1);
				cell = row.createCell(j++);
				cell.setCellValue(list.get(i).getProjectName());
				cell = row.createCell(j++);
				cell.setCellValue(list.get(i).getProjectNo());
				cell = row.createCell(j++);
				cell.setCellValue(list.get(i).getCompany());
				cell = row.createCell(j++);
				cell.setCellValue(list.get(i).getContactPerson());
				cell = row.createCell(j++);
				cell.setCellValue(list.get(i).getContact());
				cell = row.createCell(j++);
				cell.setCellValue(list.get(i).getCreateDate());
				cell = row.createCell(j++);
				cell.setCellValue(list.get(i).getStartDate());
				cell = row.createCell(j++);
				cell.setCellValue(list.get(i).getEndDate());
				cell = row.createCell(j++);
				cell.setCellValue(list.get(i).getRemarks());
			}
			wbook.write(os);// 写入到流中
			os.flush();
			os.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
