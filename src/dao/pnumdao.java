package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.cartdto;
import dto.paymentdto;
import util.DBManager;

public class pnumdao {
	private pnumdao() {
	}

	private static pnumdao instance = new pnumdao();

	public static pnumdao getinstanse() {

		return instance;
	}



	public int pnum () {
		String sql = "select max(code) from pnum"; // 理쒖떊�닚 �씪諛섏쟻�쑝濡쒕뒗 �궇吏쒕줈 desc
		int pnum=-1 ;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 占쎌뵠占쎈짗占쏙옙 占쎈뻬(嚥≪뮇�뒭) 占쎈뼊占쎌맄嚥∽옙
				pnum= (rs.getInt("max(code)"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return pnum;
	}

	
	public void insertpnum(String pnum) {
		String sql = "insert into pnum values(pcode_seq.nextval,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pnum);
		
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

}
