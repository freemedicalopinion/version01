<c:import var="xmlContent"
	url="https://www.facebook.com/feeds/page.php?format=rss20&id=${facebookId}" />

<x:parse var="doc" xml="${xmlContent}" />

<section class="widget widget-comments">
	<div class="widget-title">
		<x:out select="$doc/rss/channel/title" />
	</div>
	<div id="facebook-carousel" class="owl-carousel">
		<x:forEach var="story" select="$doc/rss/channel/item"
			varStatus="status">
			<div class="item">
				<ul>
					<li><img src="pic/doctor-4.jpg" alt="">
						<div class="author">
							<a href="#"><x:out select="title" /></a>
						</div>
						<p>
							<x:out select="description" escapeXml="false" />
							<br> <span class="date"><x:out select="pubDate" /></span>
						</p></li>
				</ul>
			</div>
		</x:forEach>
	</div>
</section>