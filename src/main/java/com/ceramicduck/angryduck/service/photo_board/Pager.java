package com.ceramicduck.angryduck.service.photo_board;

public class Pager {
	//페이지당 게시물 수
	public static final int PAGE_SCALE=10;
	//화면당 페이지 수
	public static final int BLOCK_SCALE=10;
	private int curPage; //현재 페이지
	private int prevPage; //이전 페이지
	private int nextPage; // 다음 페이지
	private int totPage; //전체 페이지 갯수
	private int totBlock; //전체 페이지 블록 갯수
	private int curBlock; //현재 페이지 블록
	private int prevBlock; //이전 페이지 블록
	private int nextBlock; //다음 페이지 블록
	
	private int pageBegin; 	//#{start}
	private int pageEnd;	//#{end}
	
	private int blockBegin; //현재 페이지 블록의 시작번호
	private int blockEnd; //현재 페이지 블록의 끝번호
	
	//생성자
	//Pager(레코드 갯수, 현재 페이지 번호)
	public Pager(int count, int curPage) {
		curBlock=1;
		this.curPage = curPage;
		setTotPage(count); //페이지의 갯수를 계산  totPage 값
		setPageRange(); //그 페이지의 게시물 번호  pageBegin, pageEnd ex)1 ~10 
		setTotBlock(); //페이지 모음이 몇개인가 totBlock
		setBlockRange(); 
		//현재 몇번째 block인가 curBlock 
		
	}
	
	public void setBlockRange() {
		curBlock=(int)Math.ceil((curPage-1)/BLOCK_SCALE)+1;
		blockBegin=(curBlock-1)*BLOCK_SCALE+1;
		blockEnd=blockBegin+BLOCK_SCALE-1;
		
		if(blockEnd > totPage)
			blockEnd=totPage;
		prevPage=(curBlock==1)?1:(curBlock-1)*BLOCK_SCALE;
		nextPage=curBlock>totBlock?(curBlock*BLOCK_SCALE) : (curBlock*BLOCK_SCALE)+1;
		if(nextPage >=totPage) nextPage=totPage;
				
	}
	
	public void setTotBlock() {
		totBlock=(int)Math.ceil(totPage/BLOCK_SCALE);
	}

	public void setPageRange() {
		pageBegin=(curPage-1)*PAGE_SCALE+1;
		pageEnd=pageBegin + PAGE_SCALE-1;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int count) {
		totPage = (int)Math.ceil(count*1.0/PAGE_SCALE);
		//소수점 이하를 올림한다.
	}

	public int getTotBlock() {
		return totBlock;
	}

	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}

	public int getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public int getPrevBlock() {
		return prevBlock;
	}

	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}

	public int getNextBlock() {
		return nextBlock;
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public int getBlockBegin() {
		return blockBegin;
	}

	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}

	public int getBlockEnd() {
		return blockEnd;
	}

	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}

	public static int getPageScale() {
		return PAGE_SCALE;
	}

	public static int getBlockScale() {
		return BLOCK_SCALE;
	}
	
}
