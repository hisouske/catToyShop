package controller;

import action.adminpage_action;
import action.cartadd_action;
import action.cartdel_action;
import action.cartpage_action;
import action.cartpay_action;
import action.detailpage_action;
import action.goodscate_action;
import action.homepage_action;
import action.login_action;
import action.loginpage_action;
import action.logout_action;
import action.paylist_action;
import action.replycode_action;
import action.reviewadd_action;
import action.reviewdel_action;
import action.sign_action;
import action.signidchk_action;

public class actionfactory {
	private static actionfactory instance = new actionfactory();

	private actionfactory() {
		super();
	}

	public static actionfactory getinstanse() {

		return instance;
	}

	public action getaction(String mcommand) {
		action action = null;
		System.out.println("action factory :" + mcommand);
		if (mcommand == null) {
			action = new homepage_action();
		}else if (mcommand.equals("login_page")) {
			action = new loginpage_action();
		}else if (mcommand.equals("sign")) {
			action = new sign_action();
		}else if (mcommand.equals("idchk")) {
			action = new signidchk_action();
		}else if (mcommand.equals("login")) {
			action = new login_action();
		}else if (mcommand.equals("logout")) {
			action = new logout_action();
		}else if (mcommand.equals("admin")) {
			action = new adminpage_action();
		}else if (mcommand.equals("category")) {
			action = new goodscate_action();
		}
		return action;
	}
	
	public action goodsaction(String gcommand) {
		action action = null;
		System.out.println("action factory :" + gcommand);
		if (gcommand == null) {
			action = new homepage_action();
		}else if (gcommand.equals("detail")) {
			action = new detailpage_action();
		}
		return action;
	}
	
	public action cartaction(String ccommand) {
		action action = null;
		System.out.println("action factory :" + ccommand);
		if (ccommand == null) {
			action = new homepage_action();
		}else if (ccommand.equals("cartpage")) {
			action = new cartpage_action();
		}else if (ccommand.equals("cartadd")) {
			action = new cartadd_action();
		}else if (ccommand.equals("cartdel")) {
			action = new cartdel_action();
		}else if (ccommand.equals("payment")) {
			action = new cartpay_action();
		}else if (ccommand.equals("paylist")) {
			action = new paylist_action();
		}
		return action;
	}
	public action reviewaction(String rcommand) {
		action action = null;
		System.out.println("action factory rcommand:" + rcommand);
		if (rcommand == null) {
			action = new homepage_action();
		}else if (rcommand.equals("reviewadd")) {
			action = new reviewadd_action();
		}else if (rcommand.equals("reviewdel")) {
			action = new reviewdel_action();
		}else if (rcommand.equals("reid")) {
			action = new replycode_action();
		}
		return action;
	}
}
