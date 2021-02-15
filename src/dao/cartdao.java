package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.cartdto;
import dto.cartdto;
import util.DBManager;

public class cartdao {
	private cartdao() {
	}

	private static cartdao instance = new cartdao();

	public static cartdao getinstanse() {

		return instance;
	}

	public List<cartdto> cartlist(String id) {
		System.out.println("ddd"+id);
		String sql = "select * from cart where id=? order by code desc"; // 理쒖떊�닚 �씪諛섏쟻�쑝濡쒕뒗 �궇吏쒕줈 desc
		List<cartdto> list = new ArrayList<cartdto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 占쎌뵠占쎈짗占쏙옙 占쎈뻬(嚥≪뮇�뒭) 占쎈뼊占쎌맄嚥∽옙
				cartdto dto = new cartdto();
				dto.setGcode(rs.getInt("gcode"));
				dto.setQtt(rs.getInt("qtt"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}

	public void insertcart(cartdto dto) {
		String sql = "insert into cart values(ccode_seq.nextval,?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setInt(2, dto.getGcode());
			pstmt.setInt(3, dto.getQtt());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public int qttcheck(int gcode, String id) {
		String sql = "select qtt from cart where gcode=? and id=?";
		int qttcheck = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gcode);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 占쎌뵠占쎈짗占쏙옙 占쎈뻬(嚥≪뮇�뒭) 占쎈뼊占쎌맄嚥∽옙
				qttcheck = (rs.getInt("qtt"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return qttcheck;
	}

	public void updateqtt(int qtt, int gcode) {
		String sql = "update cart set qtt=? where gcode=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qtt);
			pstmt.setInt(2, gcode);

			pstmt.executeUpdate();// 荑쇰━臾� �떎�뻾�븳�떎.
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	public void delcart(int gcode, String id) {
		String sql = "delete cart where gcode=? and id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gcode);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
}
