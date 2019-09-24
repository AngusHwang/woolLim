<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="note">C,CS,D,DS,E,F,FS,G,GS,A,AS,B</c:set>
<h1>
	Piano <input type="checkbox" name="mute" value="piano">
</h1>


<c:forEach var="poctv" varStatus="j" begin="1" end="2" step="1">
	<c:forEach var="noteList" items="${note}">
		<div class="sound ${noteList}${poctv} piano">
			<div>${noteList}${poctv}</div>
			<c:forEach var="plength" varStatus="i" begin="1" end="32" step="1">
				<div class='pad ${noteList}${poctv} length${plength}'>
					<input type='hidden' value="">
				</div>
			</c:forEach>
		</div>
	</c:forEach>
</c:forEach>

<div class="sound C3 piano">
	<div>C3</div>
	<c:forEach var="plength" varStatus="i" begin="1" end="32" step="1">
		<div class='pad C3 length${plength}'>
			<input type='hidden' value="">
		</div>
	</c:forEach>
	<!--  -->
</div>



