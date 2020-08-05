package com.palak.Predict;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.palak.Login.ConnectionManager;

/**
 * Servlet implementation class Tester
 */
@WebServlet("/MyClassifier")
public class MyClassifier extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Connection con;   
    Map<String,Float> unsortedMap=new HashMap<String,Float>();
    int flag=1;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyClassifier() {
        super();
        con=ConnectionManager.makeConnection();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        float[] a=new float[108];
       // String c=request.getParameter("foo");
       // int co=Integer.parseInt(c);
       // System.out.println("value of foo is"+c);
        int i;
        //String inputSymp[]=request.getParameter("symptoms");
        /*String inputSymp[]={"","","","","",""};
        for(i=0;i<co;i++)
        {
        	inputSymp[i]=request.getParameter("symp"+(i+1));
        	System.out.println(inputSymp[i]);
        }*/
		String symptoms=request.getParameter("symp1");
		String[] symp={"cough","fever","red eyes","muscle pain",
				"runny nose","sore throat","headache","loss of appetite","rashes",
				"fatigue","nausea","vomiting","diarrhea","chills","abdominal pain","weight loss",
				"dark urine","itching","mild bleeding","watery eyes","sweating","weakness",
				"nasal congestion","constipation","low bp","muscle cramp","rapid heart rate",
				"thirst","sleepiness","wheezing","chest pain","shortness of breath",
				"excessive hair loss","mood swings","weight gain","cold hands","joint pain","dehydration",
				"swelling","decreased range of motion","anemia","joint stiffness","dry cough","severe ache",
				"chest congestion","hunger","dry mouth","blurred vision","skin infection","frequent urination",
				"back pain","conjunctivitis","internal bleeding","stomach ache","stiff neck","seizure",
				"abdominal cramps","blood in the stool","bruises","swollen lymph nodes","lack of sleep",
				"depression","anxiety","suffocation","blisters","acidity","indigestion","pelvis pain",
				"vaginal discharge","irregular mensturation","cough with blood","redness of skin",
				"yellow eyes","yellow skin","pimples","pain in eyes","loss of colour","ulcers",
				"loss of sensation","nerve injury","dizziness","irritation","sinus pain","vaginal pain",
				"mental confusion","burning sensation in the eyes","eye discharge","pus","distorted vision","vision loss","swelling in foot",
				"facial bone deformity","slow growth","abdominal swelling","bleeding gums","blood in urine",
				"nose bleeding","bloating","difficulty in swallowing","hoarse voice","irritable bowel syndrome",
				"high bp","	pain in the kidney area","decreased urination","ringing in the ear","hearing loss","dark red spots",
				"sweating less than normal"
		};
		System.out.println(symp.length);
		for(i=0;i<symp.length;i++)
		{
			if(symptoms.toLowerCase().contains(symp[i].toLowerCase()))
			{
				a[i]=1;
			}
			else
			{
				a[i]=0;
			}
		}
		
		
		for(i=0;i<a.length;i++)
		{
			System.out.println(a[i]+" ");
		}
		
		String[] allDiseases={"measles","chickenpox","malaria","jaundice","dengue","appendix","pollen","tuberculosis","viral",
				"influenza","typhoid","cholera","asthma","thyroid","arthritis","pneumonia","bronchitis","diabetes",
				"brucellosis","leptospirosis","meningitis","meningitis","leukemia","salmonella","elephantiasis","chikungunya",
				"glaucoma","thrombosis","anemia","thalassemia","hemophilia","hernia","esophagitis","gilbert syndrome",
				"nephritis","uremia","fabey disease","insomnia","silicosis","pulomonary edema","anthrax","ulcer",
				"gonorrhoea","plague","yellow fever","ebola","small pox","leprosy","rabies","tetanus","zygomycosis",
				"syphilis","monkey pox","stroke","atheroma","aortic stenosis","syncope","myocarditis","rheumatic fever",
				"kidney stone","ovarian cyst","eosinophilia","carcinoma","asbestosis"
				};
		for(i=0;i<allDiseases.length;i++)
		{
			prob_disease(a,allDiseases[i]);
		}
		//System.out.println(unsortedMap);	
		Map<String,Float> sortedMap=new HashMap<String,Float>();
		sortedMap=sortByValue(unsortedMap);
		printMap(sortedMap);
		int counter=0;
		String predicted_disease="";
		for(Map.Entry<String,Float> entry : sortedMap.entrySet()) {
			predicted_disease=entry.getKey();
			request.setAttribute("disease1",entry.getKey());
            counter++;
			if(counter>=1)
				break;
        }
	    unsortedMap.clear();
		float acc;
		acc=accuracy(predicted_disease.toLowerCase());
		System.out.println("The accuracy is : "+(acc*100));
		request.setAttribute("accuracy", acc*100);
		RequestDispatcher rs= request.getRequestDispatcher("Outcome.jsp");
		rs.forward(request, response);
		
	}
	public float prob_disease(float a[],String dname)
	{	
		int i=0;
		float c_all = 0,c_disease = 0;
		float data[]=new float[108];
		String sql=null;
		float prob[]=new float[108];
		float sum[]=new float[108];
		PreparedStatement stmtSQL=null;
		ResultSet rs,rs1;
		Statement stmt; 
		float count=0;
		try{
		
		stmt=con.createStatement();
		rs1=stmt.executeQuery("select count(*) from disease_database1 where class='"+dname+"'");
		if(rs1.next())
		{
			count=Float.parseFloat(rs1.getString(1));
		}
		//System.out.println("value of count is: "+count);
		rs=stmt.executeQuery("select * from disease_database1 where class='"+dname+"'");
		
		while(rs.next()){
			
		//System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(4)+rs.getString(5)+rs.getString(6)+rs.getString(7)+rs.getString(8)+rs.getString(9)+rs.getString(10));
		for(int k=0;k<108;k++)
		{
		sum[k]+=rs.getFloat(k+1);
		}
		}
		}catch(Exception ee)
		{
		System.out.println(ee);	
		}
		
		for(i=0;i<108;i++){
			prob[i]=sum[i]/count;
			//System.out.print(prob[i]+" ");

		}
		  
		  float sum_final=1;
			 
			 //to count numerator
			 for( i=0;i<108;i++)
			 {
				if(a[i]==1){
					
					sum_final*=prob[i];
					
				}
				//if(a[i]==0){
					//sum_final+=(1-prob[i]);
				//}
					 
			 }
			  
			  sql="select count(*) from disease_database1 where class='"+dname+"'";
			  try {
				  stmtSQL = con.prepareStatement(sql);
			      rs = stmtSQL.executeQuery(sql);
			      rs.next();
			      c_disease=rs.getInt(1);		 
			  }
			  catch(Exception e)
			  {
				  System.out.println(e);
			  }
			  
			  sql="select count(*) from disease_database1";
			  try {
				  stmtSQL = con.prepareStatement(sql);
			      rs = stmtSQL.executeQuery(sql);
			      rs.next();
			      c_all=rs.getInt(1);		 
			  }
			  catch(Exception e)
			  {
				  System.out.println(e);
			  }
			  
			  sum_final=sum_final*(c_disease/c_all);
				 
			 //System.out.println(dname+"  probability calculated ="+sum_final);
				 unsortedMap.put(dname,sum_final); 
			 return sum_final;
			 }
	
	 private static Map<String,Float> sortByValue(Map<String,Float> unsortMap) {

	        // 1. Convert Map to List of Map
	        List<Map.Entry<String, Float>> list =
	                new LinkedList<Map.Entry<String,Float>>(unsortMap.entrySet());

	        // 2. Sort list with Collections.sort(), provide a custom Comparator
	        //    Try switch the o1 o2 position for a different order
	        Collections.sort(list, new Comparator<Map.Entry<String,Float>>() {
	            public int compare(Map.Entry<String,Float> o1,
	                               Map.Entry<String,Float> o2) {
	                return (o2.getValue()).compareTo(o1.getValue());
	            }
	        });

	        // 3. Loop the sorted list and put it into a new insertion order Map LinkedHashMap
	        Map<String,Float> sortedMap = new LinkedHashMap<String,Float>();
	        for (Map.Entry<String,Float> entry : list) {
	            sortedMap.put(entry.getKey(), entry.getValue());
	        }

	        return sortedMap;
	    }
	 
	 public static <K, V> void printMap(Map<K, V> map) {
	        for (Map.Entry<K, V> entry : map.entrySet()) {
	            System.out.println("Key : " + entry.getKey()
	                    + " Value : " + entry.getValue());
	        }
	    }
	float accuracy(String dis)
	{
	    String predictdisease;
	    float a[]=new float[108];
	    float tp=0,tn=0;
	    float count=0;
	    float accur=0;
	    int i;
	    PreparedStatement stmtSQL=null;
	    ResultSet rs;
	    Statement stmt; 
	    try{
	    
	    stmt=con.createStatement();
	    rs=stmt.executeQuery("select * from disease_database1");  
	    while(rs.next()) 
	    {
	        
	         for(i=1;i<=108;i++)
	        {
	            a[i-1]=Float.parseFloat(rs.getString(i));
	        }
	        predictdisease=predict(a);
	        if(!rs.getString(i).matches(dis))
	        {
	            if(!predictdisease.matches(dis))
	            {
	                tn++;
	            }
	        }
	        if(rs.getString(i).matches(dis))
	        {
	            if(predictdisease.matches(dis))
	            {
	                tp++;
	            }
	        }
	        count++;
	        unsortedMap.clear();
	        if(count>=40)
	            break;
	    }
	    }catch(Exception ee)
	    {
	    System.out.println(ee);    
	    }
	    System.out.println("value of tp is :"+tp);
	    System.out.println("value of tn is :"+tn);
	    System.out.println("value of count is :"+count);
	    accur=(tp+tn)/count;
	    System.out.println("accuracy is : "+accur);
	    return accur;
	    
	}
	
	String predict(float a[])
	{
		int i=0;
		String predicted_disease="";
		String[] allDiseases={"measles","chickenpox","malaria","jaundice","dengue","appendix","pollen","tuberculosis","viral",
				"influenza","typhoid","cholera","asthma","thyroid","arthritis","pneumonia","bronchitis","diabetes",
				"brucellosis","leptospirosis","meningitis","meningitis","leukemia","salmonella","elephantiasis","chikungunya",
				"glaucoma","thrombosis","anemia","thalassemia","hemophilia","hernia","esophagitis","gilbert syndrome",
				"nephritis","uremia","fabey disease","insomnia","silicosis","pulomonary edema","anthrax","ulcer",
				"gonorrhoea","plague","yellow fever","ebola","small pox","leprosy","rabies","tetanus","zygomycosis",
				"syphilis","monkey pox","stroke","atheroma","aortic stenosis","syncope","myocarditis","rheumatic fever",
				"kidney stone","ovarian cyst","eosinophilia","carcinoma","asbestosis"
				};
		for(i=0;i<allDiseases.length;i++)
		{
			prob_disease(a,allDiseases[i]);
		}
		Map<String,Float> sortedMap=new HashMap<String,Float>();
		sortedMap=sortByValue(unsortedMap);
		//printMap(sortedMap);
		int counter=0;
		for(Map.Entry<String,Float> entry : sortedMap.entrySet()) {
			
           
            counter++;
            predicted_disease=entry.getKey();
			if(counter>=1)
				break;
        }
		return predicted_disease;
	}
	

}
