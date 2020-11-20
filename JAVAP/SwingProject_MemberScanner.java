package JAVAP;

import java.awt.Choice;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;
import javax.swing.table.DefaultTableModel;

import JAVAP.BMEMBERSBean;


public class SwingProject_MemberScanner{ 
	String col[] = {"회원번호","회원 이름","회원 등급","전화번호","대여기간","대여횟수","대출가능 권수"};
	
	BMEMBERSMgr mgr;
	JPanel panel = new JPanel();
	JPanel mpanel = new JPanel();
	JPanel tpanel = new JPanel();
	JTable table;
	DefaultTableModel model;
	JScrollPane scr;
	Choice cho = new Choice();
	JTextField tf = new JTextField(10);
	JButton btn = new JButton("검색");
	JButton btn1 = new JButton("선택하기");
	static JFrame memberf;
	Vector<BMEMBERSBean> vlist;
	public SwingProject_MemberScanner() {
		
		mgr = new BMEMBERSMgr();
		
	    vlist = mgr.getListMember();
		String row[][] = new String[vlist.size()][10];
		for (int i = 0; i < row.length; i++) {
			BMEMBERSBean bean = vlist.elementAt(i);
			row[i][0] = bean.getMID()+"";
			row[i][1] = bean.getMNAME();
			row[i][2] = bean.getMGRADE();
			row[i][3] = bean.getMPHONE();
			row[i][4] = bean.getMAXRENTAL();
			row[i][5] = bean.getECOUNT();
			row[i][6] = bean.getELIMIT();
		}
		
		memberf = new JFrame();
		memberf.setBackground(new  Color(170,220,255));
		memberf.setVisible(true);
		memberf.setSize(700,600);
		memberf.setLocationRelativeTo(null);
		memberf.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		memberf.add(mpanel);
		
		panel.setBackground(new Color(170,220,255));
		tpanel.setBackground(new Color(170,220,255));
		mpanel.setBackground(new Color(170,220,255));
		mpanel.setLayout(null);
		tpanel.setLayout(null);
		panel.setLayout(null);
		
		cho.add("회원번호");
		cho.add("회원이름");
		cho.setBounds(110	, 50, 150, 50);
		tf.setBounds(320, 50,150 , 27);
		btn.setBounds(470, 50, 100, 27);
		panel.add(cho);
		panel.add(tf);
		panel.add(btn);
		TitledBorder jtx= 
	    		new TitledBorder(new LineBorder(Color.white),"회원 검색");
		 jtx.setTitleFont(new Font( "잘풀리는오늘 Medium", Font.PLAIN, 18 ) );
		 panel.setBorder(jtx);
		 panel.setBounds(0, 0, 700, 100);
		 tpanel.setBounds(0, 100, 700, 380);
		 mpanel.add(panel);
		 
			model = new DefaultTableModel(row,col);
			table = new JTable(model);
			 table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
			scr = new JScrollPane(table);
			table.setFont(new Font( "잘풀리는오늘 Medium", Font.PLAIN, 20) );
			 table.setRowHeight(25);
			 
			  table.getColumnModel().getColumn(0).setPreferredWidth(70);  //JTable 의 컬럼 길이 조절
			    table.getColumnModel().getColumn(1).setPreferredWidth(90);
			    table.getColumnModel().getColumn(2).setPreferredWidth(80);
			    table.getColumnModel().getColumn(3).setPreferredWidth(190);
			    table.getColumnModel().getColumn(4).setPreferredWidth(80);
			    table.getColumnModel().getColumn(5).setPreferredWidth(80);
			    table.getColumnModel().getColumn(6).setPreferredWidth(130);
			    scr.setBounds(0, 0, 670, 380);
		tpanel.add(scr);
		btn1.setBounds(550, 500, 100, 40);
		btn1.addActionListener(ac);
		mpanel.add(btn1);
		
		mpanel.add(tpanel);
		
	}
	ActionListener ac = new ActionListener() {
		
		@Override
		public void actionPerformed(ActionEvent arg0) {
			if(table.getSelectedRow()==-1) {
			MDialog md = new MDialog(memberf, "오류", true, "회원을 선택해 주세요.");
				md.setVisible(true);
			}else {
			String str0 = (String) table.getValueAt(table.getSelectedRow(),0);            //Object 타입을 모두 정수형으로 변환
			String str1 = (String) table.getValueAt(table.getSelectedRow(),1);            //Object 타입을 모두 정수형으로 변환
			String str2 = (String) table.getValueAt(table.getSelectedRow(),2);
			String str3 = (String) table.getValueAt(table.getSelectedRow(),3);
			String str4 = (String) table.getValueAt(table.getSelectedRow(),4);
			String str5 = (String) table.getValueAt(table.getSelectedRow(),5);
			SwingProject.tf1.setText(str0);
			SwingProject.tf2.setText(str1);
			SwingProject.tf3.setText(str3);
			SwingProject.tf4.setText(str4);
			SwingProject.tf5.setText(str2);
			SwingProject.tf6.setText(str5);
			SimpleDateFormat sysdate = new SimpleDateFormat();
			Calendar date = Calendar.getInstance();
			int to = Integer.parseInt(SwingProject.tf4.getText().substring(0, 1));   //문자열을 정수로 변환 
			date.add(Calendar.DATE,to);   
			String date3 = sysdate.format(date.getTime()); //더한날짜 문자열 넣기
            SwingProject.tf16.setText(date3.substring(0,10));  //시분초 자르고 넣기 
			memberf.dispose();
			}
			
		}
	};
}
