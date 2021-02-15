package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.cartdto;
import dto.goodsdto;
import dto.paymentdto;
import util.DBManager;

public class paymentdao {
	private paymentdao() {
	}

	private static paymentdao instance = new paymentdao();

	public static paymentdao getinstanse() {

		return instance;
	}

	
	
	public List<List<paymentdto>> paylist(String id) {
//		String sql = "select * from payment where id=? order by ordernum desc"; // 理쒖떊�닚 �씪諛섏쟻�쑝濡쒕뒗 �궇吏쒕줈 desc
		String sql = "select pro.name, p.* from payment p left outer join goods pro on p.gcode=pro.code where id=? order by p.ordernum desc";
		List<List<paymentdto>> list = new ArrayList<List<paymentdto>>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { // 占쎌뵠占쎈짗占쏙옙 占쎈뻬(嚥≪뮇�뒭) 占쎈뼊占쎌맄嚥∽옙
				List<paymentdto> list1 = new ArrayList<paymentdto>();
				list.add(list1);
				paymentdto dto = new paymentdto();
				dto.setName(rs.getString("name"));
				dto.setOrdernum(rs.getString("ordernum"));
				dto.setTime(rs.getString("time"));
				dto.setGcode(rs.getInt("gcode"));
				dto.setQtt(rs.getInt("qtt"));
				list1.add(dto);
				System.out.println(dto.getOrdernum());
				while (rs.next()) {
					String ordernum0 = list1.get(0).getOrdernum();
					dto = new paymentdto();
					dto.setName(rs.getString("name"));
					dto.setOrdernum(rs.getString("ordernum"));
					dto.setTime(rs.getString("time"));
					dto.setGcode(rs.getInt("gcode"));
					dto.setQtt(rs.getInt("qtt"));
					System.out.println(dto.getOrdernum()+" / "+ordernum0);
					if (dto.getOrdernum().equals(ordernum0)) {
						list1.add(dto);
					}
					else {
						list1 = new ArrayList<paymentdto>();
						list1.add(dto);
						list.add(list1);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}

	public void insertpayment(paymentdto dto) {
		String sql = "insert into payment values(ppcode_seq.nextval, ?, ?, ? ,?,trunc(sysdate,'dd'))";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getOrdernum());
			pstmt.setString(2, dto.getId());
			pstmt.setInt(3, dto.getGcode());
			pstmt.setInt(4, dto.getQtt());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	

}
