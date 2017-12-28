package learn;

import java.io.File;

public class Test {
	public static void deleteAll(File file) {

//		if (file.isFile() || file.list().length == 0) {
//			file.delete();
//		}
		File[] files = file.listFiles();
		for (int i = 0; i < files.length; i++) {
			files[i].delete();
		}
	}

	public static void main(String[] args) {
		String ff = "E:\\apache-tomcat-8.5.9\\webapps\\temp\\img";
		File f = new File(ff);
		deleteAll(f);
	}

}
