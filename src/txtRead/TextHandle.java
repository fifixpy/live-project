package txtRead;

import java.io.File;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;
import java.util.regex.Pattern;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileWriter;
import javafx.util.*;

public class TextHandle {
	private int filterType;
	private String filePath;
	private String keyContent;
	private String startTime;
	private String endTime;
	// private Vector<Pair<String, Integer>> vt = new Vector<Pair<String,
	// Integer>>();
	private Map<String, Integer> map = new HashMap<>();
	private int textType;
	private String userID;

	public TextHandle(int filterType, String filePath, String keyContent, String startTime, String endTime) {
		this.filterType = filterType;
		this.filePath = filePath;
		this.keyContent = keyContent;
		this.startTime = startTime;
		this.endTime = endTime;
		userID = null;
		textType = 0;
	}

	public Map getMap() {
		try {
			String encoding = "UTF-8";
			File file = new File(filePath);
			if (file.isFile() && file.exists()) { // �ж��ļ��Ƿ����
				StringHandle handleString = new StringHandle(startTime, endTime);
				InputStreamReader read = new InputStreamReader(new FileInputStream(file), encoding);// ���ǵ������ʽ
				BufferedReader bufferedReader = new BufferedReader(read);
				// �����ļ�
				String talkContent = null;
				String lineTxt = null;
				while ((lineTxt = bufferedReader.readLine()) != null) {
					if (textType != 0) {
						if (lineTxt.equals("")) {
							if (handleString.hasKey(keyContent, talkContent) && userID != null) { // ��������к�������"#...#"�ĳ齱�ؼ���
								handleMap(talkContent);
							}
							talkContent = null;
							continue;
						} else if (handleString.isTalkID(lineTxt)) {
							userID = null;
							textType = 0;
						} else {
							talkContent += lineTxt;
						}
					}
					if (textType == 0) { // id�еĴ���
						userID = handleString.getNameAndID(lineTxt);
						if (userID != null) {
							if (Pattern.matches("ϵͳ��Ϣ\\([1][0]+\\)", userID)) {
								userID = null;
							}
						}
						textType = 1;
						// if (userID != null) {
						// System.out.println(userID);
						// }
					}
				}
				read.close();
			} else {
				System.out.println("�Ҳ���ָ�����ļ�");
			}
		} catch (Exception e) {
			System.out.println("��ȡ�ļ����ݳ���");
			e.printStackTrace();
		}
		return map;
	}

	private void handleMap(String talkContent) {
		boolean flag = true;
		int num = 0;
		if (filterType != 1) {
			talkContent.replaceAll(keyContent, "");
			if (Pattern.matches("//s*", talkContent)) { // �����ȥ�ؼ��ֺ�������Ϊ��-->������ͨ���˹���
				flag = false;
			} else if (Pattern.matches("//s*[//[����//]]+//s*", talkContent) && filterType == 3) {
				num = 1;
			}
		}
		if (!map.containsKey(userID) && flag) { // �����idδ���ֹ�
			map.put(userID, num); // ����map
		} else if (num > 0) {
			num = (int) map.get(userID) + 1;
			map.put(userID, num);
		}
	}
}