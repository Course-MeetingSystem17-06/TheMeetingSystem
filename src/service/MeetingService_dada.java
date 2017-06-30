package service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import dao.MeetingDAO_dada;
import vo.Meeting_dada;

public class MeetingService_dada {
	private MeetingDAO_dada dao = new MeetingDAO_dada();
	private int countOfPages;// 总页面数
	private int countOfMeetings;// 总会议数量
	private int pageSize = 5;// 每页的会议数量

	// 查询所有会议记录集合
	public List<Meeting_dada> searchMeetings(String meetingname,
			String meetingroomname, String meetingbooker,
			Date meetingstarttime, Date meetingendtime,
			Date meetingbookdatestart, Date meetingbookdateend) {
		List<Meeting_dada> list = dao.selectMeetingsByFilter(meetingname,
				meetingroomname, meetingbooker, meetingstarttime,
				meetingendtime, meetingbookdatestart, meetingbookdateend);
		countOfMeetings = list.size();
		return list;
	}

	// 查询每一页的数据集合
	public List<Meeting_dada> searchMeetingsOfOnePage(String meetingname,
			String meetingroomname, String meetingbooker,
			Date meetingstarttime, Date meetingendtime,
			Date meetingbookdatestart, Date meetingbookdateend, int start,
			int count) {
		return dao.selectMeetingsOfOnePage(meetingname, meetingroomname,
				meetingbooker, meetingstarttime, meetingendtime,
				meetingbookdatestart, meetingbookdateend, start, count);
	}

	// 返回总页数
	public int getCountOfPages() {
		countOfPages = (countOfMeetings % pageSize == 0) ? countOfMeetings
				/ pageSize : countOfMeetings / pageSize + 1;
		return this.countOfPages;
	}

	// 返回所有记录条数
	public int getCountOfMeetings() {
		return this.countOfMeetings;
	}

	// 返回每页的记录条数，默认为5
	public int getPageSize() {
		return this.pageSize;
	}

	public void updateillustrate(String meetingid, String illustrate) {
		dao.updateMeetingIllustrate(meetingid, illustrate);
	}

	// 查询当前用户自己预定的会议的集合
	public List<Meeting_dada> searchMyBookedMeetings(String meetingbooker) {
		List<Meeting_dada> list = dao.selectMeetingsByFilter("", "",
				meetingbooker, null, null, null, null);
		return list;
	}

	// 查询当前用户未来七天的会议集合
	public List<Meeting_dada> searchMyLatestMeetings(String meetingbooker) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		Date now = new Date();
		Date future = new Date();
		future.setTime(now.getTime()+604800000);//向后一周时间
		
        String now_s = format.format(now).toString();
        String future_s = format.format(future).toString();
        System.out.println(now_s+future_s);
		List<Meeting_dada> list = dao.selectLatestMeetings(meetingbooker, now_s, future_s);
		return list;
	}
	//查询当前用户已取消且未来本应参加的会议
	public List<Meeting_dada> searchMyCancelMeetings(String meetingbooker) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		Date now = new Date();
		String now_s = format.format(now).toString();
		List<Meeting_dada> list = dao.selectCancelMeetings(meetingbooker, now_s);
		return list;

	}

}
