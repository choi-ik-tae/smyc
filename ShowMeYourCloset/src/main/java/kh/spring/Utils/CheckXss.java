package kh.spring.Utils;

public class CheckXss {
	
	public static String checkXss(String contents) {
		String replaceContents = contents.replaceAll("&", "&amp;");
		replaceContents = replaceContents.replaceAll("'", "&#x27;");
		replaceContents = replaceContents.replaceAll("\"", "&quot;");
		replaceContents = replaceContents.replaceAll("<", "&lt;");
		replaceContents = replaceContents.replaceAll(">", "&gt;");
		replaceContents = replaceContents.replaceAll("/", "&#x2F;");

		return replaceContents;
	}

}
