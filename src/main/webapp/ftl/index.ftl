<#include "top_index.ftl">
    <div class="content">
        <div class="content-topic">
            <div class="content-topic-name"></div>
            
                <div class="content-topic-title">
               
                  <ul>
                  <@articleListTag posid=1 size=3; list>
                <#list list as article>
                    <li> <a href="<@c.url value="${contextPath}/content.action?id=${article.id}"/>" target="_blank">
                    <#if article.shortTitle?? && article.shortTitle!="">${article.shortTitle}<#else>${article.title}</#if>
                </a></li>
                </#list>
            </@articleListTag>
                  </ul>
                </div>
           <div class="scroll-btn"><a class="prev" href="javascript:void(0)"></a> <a class="next" href="javascript:void(0)"></a></div>     
        </div>
        <div class="row-nav">
            <div class="slider">
                <div class="slider-nav">
                    <ul>
                    <@articleListTag posid=2 size=5; list>
                        <#list list as article>
                            <li><img src="${contextPath}${article.thumb}"/>
                                <div class="slider-title">
                                    <a href="<@c.url value="${contextPath}/content.action?id=${article.id}"/>" target="_blank">
                                        <#if article.shortTitle?? && article.shortTitle!="">${article.shortTitle}<#else>${article.title}</#if>
                                    </a>
                                </div>
                                <div class="slider-title-background"></div>
                            </li>
                        </#list>
                    </@articleListTag>
                    </ul>
                </div>
                <div class="slider-cur">
                    <ul>
                    </ul>
                </div>
                <a class="prev" href="javascript:void(0)"></a> <a class="next" href="javascript:void(0)"></a> </div>
            <div class="headline">
                <div class="headline-nav">
                    <div class="headline-title">
                    <@categoryTag id=61; cat>
                        <h2>${cat.name}</h2>
                    </@categoryTag>
                    </div>
                    <div class="headline-content">
                        <ul>
                        <@articleListTag catid=61 size=5; list>
                            <#list list as article>
                                <li>
                                    <i></i>
                                    <a href="<@c.url value="${contextPath}/content.action?id=${article.id}"/>" target="_blank">
                                        <#if article.shortTitle?? && article.shortTitle!="">${article.shortTitle}<#else>${article.title}</#if>
                                    </a>
                                </li>
                            </#list>
                        </@articleListTag>
                        </ul>
                    </div>
                    <div class="headline-xsjw">
                    <@categoryTag id=59; cat>
                        <a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank">
                            ${cat.name}<span class="span-cut">|</span>
                            <@articleListTag catid=59 size=1; list>
                                <#list list as article>
                                    <#if article.shortTitle?? && article.shortTitle!="">${article.shortTitle}<#else>${article.title}</#if>
                                </#list>
                            </@articleListTag>
                        </a>
                    </@categoryTag>

                    </div>
                </div>
            </div>
        </div>
        <div class="col-left">
            <div class="module-nav">
                <div class="module-title">
                <@categoryTag id=70; cat>
                    <div class="module-title-nav">
                        <h2 class="on">${cat.name}</h2>
                    </div>
                    <div class="module-title-more">
                        <a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank">更多</a>
                    </div>
                </@categoryTag>
                </div>
                <div class="module-list">
                    <ul>
                    <@articleListTag catid=70 size=8; list>
                        <#list list as article>
                            <li>
                                <i></i>
                                <a href="<@c.url value="${contextPath}/content.action?id=${article.id}"/>" target="_blank">
                                    <#if article.shortTitle?? && article.shortTitle!="">${article.shortTitle}<#else>${article.title}</#if>
                                </a>
                                <span>${article.date?string("MM-dd")}</span>
                            </li>
                        </#list>
                    </@articleListTag>
                    </ul>
                </div>
            </div>
            <div class="module-nav">
                <div class="module-title">
                 <@categoryTag id=64; cat>
                    <div class="module-title-nav">
                        <h2 class="cursor">${cat.name}</h2>
                    </div>
                    <div class="module-title-more">
                        <a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank">更多</a>
                    </div>
                  </@categoryTag>
                </div>
                <div class="module-list">
                    <ul>
                    <@articleListTag catid=99 size=3; list>
                        <#list list as article>
                            <li>
                                <i></i>
                                <a href="<@c.url value="${contextPath}/content.action?id=${article.id}"/>" target="_blank">
                                    <#if article.shortTitle?? && article.shortTitle!="">${article.shortTitle}<#else>${article.title}</#if>
                                </a>
                                <span>${article.date?string("MM-dd")}</span>
                            </li>
                        </#list>
                    </@articleListTag>
                    </ul>
                    <div class="dotline"></div>
                    <ul>
                    <@articleListTag catid=100 size=3; list>
                        <#list list as article>
                            <li>
                                <i></i>
                                <a href="<@c.url value="${contextPath}/content.action?id=${article.id}"/>" target="_blank">
                                    <#if article.shortTitle?? && article.shortTitle!="">${article.shortTitle}<#else>${article.title}</#if>
                                </a>
                                <span>${article.date?string("MM-dd")}</span>
                            </li>
                        </#list>
                    </@articleListTag>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-right">
            <div class="module-sifeng">
              <ul>
				<@categoryTag id=105; cat>
                        <li>
                            <a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank">${cat.name}</a>
                        </li>
                </@categoryTag>
				<@categoryTag id=106; cat>
                        <li>
                            <a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank">${cat.name}</a>
                        </li>
                </@categoryTag>
				<@categoryTag id=107; cat>
                        <li>
							<#if cat.url?substring(0,4)=="http">
								<a href="${cat.url}" target="_blank">${cat.name}</a>
							<#else>
								<a href="${contextPath}/${cat.url}" target="_blank">${cat.name}</a>
							</#if>
                        </li>
                </@categoryTag>
				<@categoryTag id=76; cat>
                        <li>
                            <a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank">${cat.name}</a>
                        </li>
                </@categoryTag>
              </ul>
            </div>
            <div class="module-graphic-01">
            <@categoryTag id=71; cat>
                <a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank">
                    <img src="pic/baoguang.jpg" width="480" height="75"/>
                </a>
            </@categoryTag>
            </div>
            <div class="module-report">
                <ul>
                <@categoryTag id=95; cat>
                    <li><a href="${cat.url}" target="_blank">
                        <img src="images/ruhejubao.png" width="235" height="58"/>
                    </a></li>
                </@categoryTag>
                <@categoryTag id=96; cat>
                    <li><a href="${cat.url}" target="_blank">
                        <img src="images/woyaojubao.png" width="235" height="58"/>
                    </a></li>
                </@categoryTag>
                <@categoryTag id=97; cat>
                    <li><a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank">
                        <img src="images/qitatujing.png" width="235" height="58"/>
                    </a></li>
                </@categoryTag>
                <@categoryTag id=98; cat>
                    <li><a href="${cat.url}" target="_blank">
                        <img src="images/jubaochaxun.png" width="235" height="58"/>
                    </a></li>
                </@categoryTag>
                </ul>
            </div>
            <div class="module-contact">
                <div class="module-contact-nav">
                    <p>来信请寄：东营市纪委信访室      邮政编码：252000</p>
                    <p>来访请到：东营市府前大街市政府市纪委来访接待室</p>
                    <p>举报电话：(0546)12388     网址：www.dyjw.gov.cn</p>
                </div>
            </div>
            <div class="module-eti">
                <div class="module-eti-nav"><i></i>关于巡查工作，您想说点什么？
                <@categoryTag id=75; cat>
                    <a class="module-eti-enter" href="<@c.url value="${contextPath}/topic.action?catid=${cat.id}&page=1"/>" target="_blank">参与</a>
                </@categoryTag>
                </div>
            </div>
        </div>
        <div class="clear"></div>
        <div class="col-left">
            <div class="module-nav">
                <div class="module-title">
                <@categoryTag id=73; cat>
                    <div class="module-title-nav">
                        <h2 class="on">${cat.name}</h2>
                    </div>
                    <div class="module-title-more">
                        <a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank">更多</a>
                    </div>
                </@categoryTag>
                </div>
                <div class="module-hd">
                    <ul>
                    <@categoryTag id=74; cat>
                        <li class="on">
                            <a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank"><img src="images/anwer_h_s.png" width="28" height="20" />${cat.name}</a>
                        </li>
                    </@categoryTag>
                    <@categoryTag id=108; cat>
                        <li>
                            
							<#if cat.url?substring(0,4)=="http">
								<a href="${cat.url}" target="_blank"><img src="images/interactive_s.png" width="28" height="20" />${cat.name}</a>
							<#else>
								<a href="${contextPath}/${cat.url}" target="_blank"><img src="images/interactive_s.png" width="28" height="20" />${cat.name}</a>
							</#if>
                            
                        </li>
                    </@categoryTag>
                    <@categoryTag id=77; cat>
                        <li>
                            <a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank"><img src="images/project_s.png" width="28" height="20" />${cat.name}</a>
                        </li>
                    </@categoryTag>
                    </ul>
                </div>
                <div class="module-list">
                    <ul>
                    <@articleListTag catid=74 size=6; list>
                        <#list list as article>
                            <li>
                                <i></i>
                                <a href="<@c.url value="${contextPath}/content.action?id=${article.id}"/>" target="_blank">
                                    <#if article.shortTitle?? && article.shortTitle!="">${article.shortTitle}<#else>${article.title}</#if>
                                </a>
                                <span>${article.date?string("MM-dd")}</span>
                            </li>
                        </#list>
                    </@articleListTag>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-right">
            <div class="module-nav module-tab">
                <div class="module-title">
                <@categoryTag id=78; cat>
                    <div class="module-title-nav">
                        <h2 class="on">${cat.name}</h2>
                    </div>
                    <div class="module-title-more">
                        <a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank">更多</a>
                    </div>
                </@categoryTag>
                </div>
                
                  <div class="module-title2">
          <ul class="module-title2-tab">
          <@categoryTag id=101; cat>
            <li><a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank">${cat.name}</a></li>
          </@categoryTag>
          <@categoryTag id=102; cat>
            <li><a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank">${cat.name}</a></li>
          </@categoryTag>
          <@categoryTag id=103; cat>
            <li><a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank">${cat.name}</a></li>
          </@categoryTag>
          </ul>
        </div>
        <div class="module-list">
          <ul>
            <@articleListTag catid=101 size=3; list>
                        <#list list as article>
                            <li>
                                <i></i>
                                <a href="<@c.url value="${contextPath}/content.action?id=${article.id}"/>" target="_blank">
                                    <#if article.shortTitle?? && article.shortTitle!="">${article.shortTitle}<#else>${article.title}</#if>
                                </a>
                                <span>${article.date?string("MM-dd")}</span>
                            </li>
                        </#list>
                    </@articleListTag>
          </ul>
          <ul>
            <@articleListTag catid=102 size=3; list>
                        <#list list as article>
                            <li>
                                <i></i>
                                <a href="<@c.url value="${contextPath}/content.action?id=${article.id}"/>" target="_blank">
                                    <#if article.shortTitle?? && article.shortTitle!="">${article.shortTitle}<#else>${article.title}</#if>
                                </a>
                                <span>${article.date?string("MM-dd")}</span>
                            </li>
                        </#list>
                    </@articleListTag>
          </ul>
          <ul>
            <@articleListTag catid=103 size=3; list>
                        <#list list as article>
                            <li>
                                <i></i>
                                <a href="<@c.url value="${contextPath}/content.action?id=${article.id}"/>" target="_blank">
                                    <#if article.shortTitle?? && article.shortTitle!="">${article.shortTitle}<#else>${article.title}</#if>
                                </a>
                                <span>${article.date?string("MM-dd")}</span>
                            </li>
                        </#list>
                    </@articleListTag>
          </ul>
        </div>
        
        <div class="module-graphic-02">
                    <div class="module-graphic-03" style="margin-right:10px"><@categoryTag id=79; cat>
                    <a href="http://${cat.url}" target="_blank"><img src="pic/pingtai.jpg" width="235" height="55"/></a>
                </@categoryTag></div>
          <div class="module-graphic-03"><a href="#" target="_blank"><@categoryTag id=82; cat>
                    <a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank"><img src="pic/dengji.jpg" width="235" height="55"/></a>
                </@categoryTag></a></div>
          
                    <div class="module-graphic-03" style="margin-right:10px">
                    <@categoryTag id=80; cat>
                        <a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank"><img src="pic/fangzheng.jpg" width="235" height="55"/></a>
                    </@categoryTag>
                    </div>
                    <div class="module-graphic-03">
                    <@categoryTag id=81; cat>
                        <a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank"><img src="pic/qingfeng.jpg" width="235" height="55"/></a>
                    </@categoryTag>
                    </div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
        <div class="module-scroll">
            <div class="module-title">
            <@categoryTag id=83; cat>
                <div class="module-title-nav">
                    <h2 class="on">${cat.name}</h2>
                </div>
                <div class="module-title-more">
                    <a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank">更多</a>
                </div>
            </@categoryTag>
            </div>
            <div class="module-image">
                <ul>
                <@categoryListTag pid=83; list>
                    <#list list as cat>
                    <li><a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>" target="_blank">${cat.name}</a></li>
                    </#list>
                </@categoryListTag>
                </ul>
            </div>
            <div class="module-scroll-nav">
                <ul>
                <@articleListTag posid=3 size=10; list>
                    <#list list as article>
                        <li>
                            <a href="<@c.url value="${contextPath}/content.action?id=${article.id}"/>" target="_blank">
                                <img src="${contextPath}${article.thumb}"/>
                            </a>
                            <p>
                                <a href="<@c.url value="${contextPath}/content.action?id=${article.id}"/>" target="_blank">
                                    <#if article.shortTitle?? && article.shortTitle!="">${article.shortTitle}<#else>${article.title}</#if>
                                </a>
                            </p>
                        </li>
                    </#list>
                </@articleListTag>
                </ul>
            </div>
        </div>
        <div class="clear"></div>
        <div class="module-links">
            <div class="module-title">
                <div class="module-title-nav">
                    <h2 class="on">友情链接</h2>
                </div>
                <div class="module-links-tab">
                    <ul>
                        <@linkCategoryListTag; list>
                            <#list list as linkCategory>
                                <li>${linkCategory.name}</li>
                            </#list>
                        </@linkCategoryListTag>
                    </ul>
                </div>
            </div>
            <div class="module-links-nav">
            <@linkCategoryListTag; list>
                <#list list as linkCategory>
                    <ul>
                    <@linkListTag catid=linkCategory.id; links>
                        <#list links as link>
                            <li><a href="http://${link.url}" target="_blank">${link.name}</a></li>
                        </#list>
                    </@linkListTag>
                    </ul>
                </#list>
            </@linkCategoryListTag>
            </div>
        </div>
    </div>
<#include "bottom.ftl">
