<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table id="example1" class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>신고일</th>
										<th>신고 위치?</th>
										<th>신고자</th>
										<th>피신고자</th>
										<th>진행상태</th>
									</tr>
								</thead>
								<tbody>
								<%
										for (int i = 0; i < 10; i++) {
								%>
									<tr class="singo_btn">
										<td>22-08-24</td>
										<td>게시판</td>
										<td class="singo_id">박예솔(yesol_vvv)</td>
										<td class="suspect_id">심준규(simjunq)</td>
										<td>처리중</td>
									</tr>

									<tr class="singo_btn">
										<td>22-08-24</td>
										<td>댓글</td>
										<td class="singo_id">심준규(simjunq)</td>
										<td class="suspect_id">장문기(iammoong)</td>
										<td>처리중</td>
									</tr>

									<tr class="singo_btn">
										<td>22-08-24</td>
										<td>채팅</td>
										<td class="singo_id">장문기(iammoong)</td>
										<td class="suspect_id">박예솔(yesol_vvv)</td>
										<td>처리완료</td>
									</tr>
										<%
										} 
										%>
								</tbody>
							</table>