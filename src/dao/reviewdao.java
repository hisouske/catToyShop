package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.goodsdto;
import dto.reviewdto;
import util.DBManager;

public class reviewdao {

	public int sum1 = 0;
	public int cnt1 = 0;

	private reviewdao() {
	}

	private static reviewdao instance = new reviewdao();

	public static reviewdao getinstanse() {

		return instance;
	}

	public void insertreview(reviewdto dto) {
		String sql = "insert into review values(rcode_seq.nextval,? ,?, ?, ?, ?,CURRENT_TIMESTAMP)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getAdmincode());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getText());
			pstmt.setInt(4, dto.getPoint());
			pstmt.setInt(5, dto.getGcode());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	
	
	
	
	public List<reviewdto> reviewlist(int gcode) {
		String sql = "select * from review where gcode=? and admincode=0 order by code desc"; // 理쒖떊�닚 �씪諛섏쟻�쑝濡쒕뒗 �궇吏쒕줈 desc
		List<reviewdto> list = new ArrayList<reviewdto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		int sum = 0;
		int cnt = 0;

		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gcode);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 占쎌뵠占쎈짗占쏙옙 占쎈뻬(嚥≪뮇�뒭) 占쎈뼊占쎌맄嚥∽옙
				reviewdto dto = new reviewdto();
				dto.setCode(rs.getInt("code"));
				dto.setGcode(rs.getInt("gcode"));
				dto.setId(rs.getString("id"));
				dto.setPoint(rs.getInt("point"));
				if (rs.getInt("point") != 0) {
					sum += (rs.getInt("point"));
					cnt++;
				}
				dto.setText(rs.getString("text"));
				dto.setAdmincode(rs.getInt("admincode"));
				list.add(dto);
			}
			sum1 = sum;
			cnt1 = cnt;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	public List<reviewdto> rereviewlist(int gcode) {
		String sql = "select * from review where gcode=? and point=0 order by code desc"; // 理쒖떊�닚 �씪諛섏쟻�쑝濡쒕뒗 �궇吏쒕줈 desc
		List<reviewdto> list = new ArrayList<reviewdto>();
		Connection conn = null;
		PreparedStatement pstmt = null;

		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gcode);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 占쎌뵠占쎈짗占쏙옙 占쎈뻬(嚥≪뮇�뒭) 占쎈뼊占쎌맄嚥∽옙
				reviewdto dto = new reviewdto();
				dto.setCode(rs.getInt("code"));
				dto.setGcode(rs.getInt("gcode"));
				dto.setId(rs.getString("id"));
				dto.setPoint(rs.getInt("point"));
				dto.setText(rs.getString("text"));
				dto.setAdmincode(rs.getInt("admincode"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}


	public void delreview(int code) {
		String sql = "delete review where code=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
}
