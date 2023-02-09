package kr.board.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
//web.xml 대신
public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer{

	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {RootConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {ServletConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
		// TODO Auto-generated method stub
		return new String[]	{"/"};
	}

	@Override
	protected Filter[] getServletFilters() {
	CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
	encodingFilter.setEncoding("UTF-8"); //한글 인코딩
	encodingFilter.setForceEncoding(true);
	return new Filter[]{encodingFilter};
	}
	
	
	
	

}
