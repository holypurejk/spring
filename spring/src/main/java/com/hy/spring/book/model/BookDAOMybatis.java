package com.hy.spring.book.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class BookDAOMybatis extends SqlSessionDaoSupport
	implements BookDAO{
	
	private String namespace="config.mybatis.mapper.oracle.book";

	@Override
	public int insertBook(BookVO vo) {
		return getSqlSession().insert(namespace+".insertBook",vo);
	}

	
	/*public int insertBook(BookVO vo){
		//board table에 insert
		Connection conn=null;
		PreparedStatement ps=null;
		int cnt;
		
		try {
			conn = pool.getConnection();
			
			String sql="insert into book(no,title,publisher,price)"+
					" values(book_seq.nextval,?,?,?)";
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getPublisher());
			ps.setInt(3, vo.getPrice());
			
			cnt = ps.executeUpdate();
			System.out.println("책 등록 결과 cnt="+cnt+", 입력값 vo="
					+ vo);
		}finally {
			pool.dbClose(ps, conn);
		}
		
		return cnt;
	}
	
	public List<BookVO> selectAll(String searchCondition,
			String searchKeyword) throws SQLException{

		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<BookVO> list=new ArrayList<>();
		
		try {
			conn=pool.getConnection();
			
			String sql="select * from book ";
			if(searchKeyword!=null && !searchKeyword.isEmpty()) {
				sql+=" where "+searchCondition+" like '%'||?||'%'";
			}
			sql+=" order by no desc";
			
			ps=conn.prepareStatement(sql);

			if(searchKeyword!=null && !searchKeyword.isEmpty()) {
				ps.setString(1, searchKeyword);
			}
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int no=rs.getInt("no");
				String title=rs.getString("title");
				String publisher=rs.getString("publisher");
				int price=rs.getInt("price");
				Timestamp joindate=rs.getTimestamp("joindate");
				
				BookVO vo
				=new BookVO(no, title, publisher, price, joindate);
				
				list.add(vo);
			}
			System.out.println("전체조회 결과 list.size()="+list.size()
				+", 입력값 condition="+ searchCondition+", keyword="
				+ searchKeyword);
		}finally {
			pool.dbClose(rs, ps, conn);
		}
		return list;
	}
	
	public BookVO selectByNo(int no) throws SQLException {
		//no에 해당하는 글 조회
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		BookVO vo = new BookVO();
		
		try {
			conn=pool.getConnection();
			
			String sql="select * from book where no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				vo.setNo(no);
				vo.setTitle(rs.getString("title"));
				vo.setPublisher(rs.getString("publisher"));
				vo.setPrice(rs.getInt("price"));
				vo.setJoindate(rs.getTimestamp("joindate"));
			}
			
			System.out.println("책 상세조회 결과 vo="+ vo +", 입력값 no="
					+no);
		}finally {
			pool.dbClose(rs, ps, conn);
		}
		
		return vo;
	}
	
	public int updateBoard(BookVO vo) throws SQLException {
		//수정 처리
		
		Connection conn=null;
		PreparedStatement ps=null;
		int cnt=0;
		
		try {
			conn=pool.getConnection();
			
			String sql="update book" + 
					   " set title=?,publisher=?,price=?" + 
					   " where no=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getPublisher());
			ps.setInt(3, vo.getPrice());
			ps.setInt(4, vo.getNo());
			
			cnt=ps.executeUpdate();
			System.out.println("글 수정 결과 cnt="+cnt
					+", 입력값 vo="+vo);
		}finally {
			pool.dbClose(ps, conn);
		}
		return cnt;
	}
	
	public int deleteBoard(int no) throws SQLException {
		//글 삭제
		Connection conn=null;
		PreparedStatement ps=null;
		int cnt;
		
		try {
			conn=pool.getConnection();
			
			String sql="delete from book where no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,no);
			
			cnt = ps.executeUpdate();
			System.out.println("글 삭제 결과 cnt="+cnt+", 입력값 no="
					+no);
		}finally {
			pool.dbClose(ps, conn);
		}
		
		return cnt;
	}*/
	
}
