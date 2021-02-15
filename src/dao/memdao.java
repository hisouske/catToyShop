package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.memdto;
import util.DBManager;

public class memdao {
	private memdao() {
	}

	private static memdao instance = new memdao();

	public static memdao getinstanse() {

		return instance;
	}

	public void insertmem(memdto dto) {
		String sql = "insert into member values(?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public String loginmem(String id, String pw) {

		String sql = "select pw,name from member where id=?";
		String name = null;

		try {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					if (pw.equals(rs.getString("pw"))) {
						name = rs.getString("name");
					}

				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return name;

	}
	public String idchk(String chkid) {

		String sql = "select pw,name from member where id=?";
		String sign = "possible";

		try {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, chkid);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					
						sign ="impossible";
					

				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return sign;

	}
	
	
	
	
}
