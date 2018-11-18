package txtRead;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

public class MapHandle {
	private Map<String, Integer> hashMap;
	private Map<String, Integer> preMap;
	private int totalNum;
	
	public MapHandle(Map<String, Integer> map, Map<String, Integer> preMap, int totalNum) {
		// TODO Auto-generated constructor stub
		hashMap = map;
		this.preMap = preMap;
		this.totalNum = totalNum;
	}

	public ArrayList<Entry<String, Integer>> sortMap(Map<String, Integer> hashMap) {
		int size = hashMap.size();
		randomMap();
		
		ArrayList<Entry<String, Integer>> list = new ArrayList<>(hashMap.entrySet());
		
		//��������
        Collections.sort(list, new Comparator<Map.Entry<String, Integer>>() {
            @Override
            public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
                return -o1.getValue().compareTo(o2.getValue());//����ǰ�߼Ӹ��ű�Ϊ����
            }
        });
        
        //���������map
        int i = 0;
        Iterator<Entry<String, Integer>> iterator = list.iterator();
        for(Entry<String, Integer> m : list){
            //System.out.println(m.getKey()+"="+m.getValue());
            if (preMap.containsKey(m.getKey())) {
            	i += (int)(((double)preMap.get(m.getKey()) / (double)totalNum) * size * 0.3);
            }
        	hashMap.put(m.getKey(), i);
            i++;
            //System.out.println(m.getKey()+"="+m.getValue());
        }
        
        return list;
	}

	private void randomMap() {
		MonteCarlo m = new MonteCarlo();
		m.rand(hashMap);
	}
}
