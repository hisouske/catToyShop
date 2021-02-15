package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.goodsdto;
import dto.memdto;
import util.DBManager;

public class goodsdao {
	private goodsdao() {
	}

	private static goodsdao instance = new goodsdao();

	public static goodsdao getinstanse() {

		return instance;
	}

	public void insertgoods(goodsdto dto) {
		String sql = "insert into goods values(gcode_seq.nextval,?, ?, ?, ?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getQuantity());
			pstmt.setString(4, dto.getPic());
			pstmt.setInt(5, dto.getPrice());
			pstmt.setString(6, dto.getDpic());
			pstmt.setString(7, dto.getDtext());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public List<goodsdto> goodslist(int start, int end ) {
		String sql = "select t.* from (select sub.*, rownum as rnum from (select * from goods order by code DESC) sub) t where rnum between ? and ?"; // 理쒖떊�닚 �씪諛섏쟻�쑝濡쒕뒗 �궇吏쒕줈 desc
		List<goodsdto> list = new ArrayList<goodsdto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 占쎌뵠占쎈짗占쏙옙 占쎈뻬(嚥≪뮇�뒭) 占쎈뼊占쎌맄嚥∽옙
				goodsdto dto = new goodsdto();
				dto.setCode(rs.getInt("code"));
				dto.setCategory(rs.getString("category"));
				dto.setName(rs.getString("name"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setPic(rs.getString("pic"));
				dto.setPrice(rs.getInt("price"));
				dto.setDpic(rs.getString("dpic"));
				dto.setDtext(rs.getString("dtext"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	public List<goodsdto> allgoodslist() {
		String sql = "select gs.code, gs.name, gs.pic from goods gs right outer join (select * from (select rownum as rnum, tempt.* from (select gcode, sum(qtt) qtt from payment group by gcode order by qtt desc) tempt)where rnum>=1 and rnum<=5) gqtt on gs.code=gqtt.gcode order by gqtt.qtt desc"; // 理쒖떊�닚 �씪諛섏쟻�쑝濡쒕뒗 �궇吏쒕줈 desc
		List<goodsdto> list = new ArrayList<goodsdto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 占쎌뵠占쎈짗占쏙옙 占쎈뻬(嚥≪뮇�뒭) 占쎈뼊占쎌맄嚥∽옙
				goodsdto dto = new goodsdto();
				dto.setCode(rs.getInt("code"));
				dto.setName(rs.getString("name"));
				dto.setPic(rs.getString("pic"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}

	
	public List<goodsdto> goodslist(String category) {
		String sql = "select * from goods where category=? order by code desc"; // 理쒖떊�닚 �씪諛섏쟻�쑝濡쒕뒗 �궇吏쒕줈 desc
		List<goodsdto> list = new ArrayList<goodsdto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 占쎌뵠占쎈짗占쏙옙 占쎈뻬(嚥≪뮇�뒭) 占쎈뼊占쎌맄嚥∽옙
				goodsdto dto = new goodsdto();
				dto.setCode(rs.getInt("code"));
				dto.setCategory(rs.getString("category"));
				dto.setName(rs.getString("name"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setPic(rs.getString("pic"));
				dto.setPrice(rs.getInt("price"));
				dto.setDpic(rs.getString("dpic"));
				dto.setDtext(rs.getString("dtext"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}

	public goodsdto onegoods(int code) {
		String sql = "select * from goods where code=?"; // 理쒖떊�닚 �씪諛섏쟻�쑝濡쒕뒗 �궇吏쒕줈 desc
		goodsdto dto = new goodsdto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 占쎌뵠占쎈짗占쏙옙 占쎈뻬(嚥≪뮇�뒭) 占쎈뼊占쎌맄嚥∽옙

				dto.setCode(rs.getInt("code"));
				dto.setCategory(rs.getString("category"));
				dto.setName(rs.getString("name"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setPic(rs.getString("pic"));
				dto.setPrice(rs.getInt("price"));
				dto.setDpic(rs.getString("dpic"));
				dto.setDtext(rs.getString("dtext"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return dto;
	}

	public int allCount() {
		String sql = "select count(*) from goods";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return 0;
	}

}
