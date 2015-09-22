<@configTag; config>
<div class="footer">
    <div class="footer-nav">
        <p>${config.copyright}</p>
        <p>${config.filingNum}</p>
    </div>
</div>
</@configTag>
</div>
<script type="text/javascript">
$(".slider").slide({titCell:".slider-cur ul",mainCell:".slider-nav ul",autoPage:true,effect:"left",autoPlay:true,pnLoop:false,interTime:4000});
$(".header-banner").slide({mainCell:".site-slider ul",autoPlay:true,interTime:4000,effect:"fold"});
$(".content-topic").slide({mainCell:".content-topic-title ul",autoPlay:true,interTime:5000,effect:"topLoop"});
$(".module-tab").slide({ titCell:".module-title2-tab li",mainCell:".module-list",delayTime:0 });
$(".module-scroll").slide({mainCell:".module-scroll-nav ul",autoPlay:true,effect:"leftMarquee",vis:6,interTime:50});
$(".module-links").slide({ titCell:".module-links-tab li",mainCell:".module-links-nav",delayTime:0 });
</script>
</body>
</html>