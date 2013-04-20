<%@ page defaultCodec="html" %>
<%@ page import="org.springframework.util.ClassUtils" %>
<%@ page import="grails.plugin.searchable.internal.lucene.LuceneUtils" %>
<%@ page import="grails.plugin.searchable.internal.util.StringQueryUtils" %>
<html>
  <head>
    <meta name="layout" content="main">
    <title><g:if test="${params.q && params.q?.trim() != ''}">${params.q} - </g:if>Buscar en RetroShop</title>

    <script type="text/javascript">
        var focusQueryInput = function() {
            document.getElementById("q").focus();
        }
    </script>
  </head>
  <body onload="focusQueryInput();">
  <section id="content"><!-- Define the content #2 section    <g:form name="carro" url="[action:'micarrito',controller:'Carrito']">  </g:form> -->
      <div class="col3">
        <div class="dbox">
          <div class="head">Resultados</div>
          <div class="tags">
            <ul>

              <g:set var="haveQuery" value="${params.q?.trim()}" />
              <g:set var="haveResults" value="${searchResult?.results}" />
              <div class="title">
                <span>
                  <g:if test="${haveQuery && haveResults}">
                    Mostrando <strong>${searchResult.offset + 1}</strong> - <strong>${searchResult.results.size() + searchResult.offset}</strong> de <strong>${searchResult.total}</strong>
                    resultados para <strong>${params.q}</strong>

                  </g:if>
                  <g:else>
                    &nbsp;
                  </g:else>
                </span>
              </div>

              <g:if test="${haveQuery && !haveResults && !parseException}">
                <p>Nothing matched your query - <strong>${params.q}</strong></p>
                <g:if test="${!searchResult?.suggestedQuery}">
                  <p>Suggestions:</p>
                  <ul>
                    <li>Try a suggested query: <g:link controller="producto" action="search" params="[q: params.q, suggestQuery: true]">Search again with the <strong>suggestQuery</strong> option</g:link><br />
                    <em>Note: Suggestions are only available when classes are mapped with <strong>spellCheck</strong> options, either at the class or property level.<br />
                      The simplest way to do this is add <strong>spellCheck "include"</strong> to the domain class searchable mapping closure.<br />
                      See the plugin/Compass documentation Mapping sections for details.</em>
                    </li>
                  </ul>
                </g:if>
              </g:if>

              <g:if test="${searchResult?.suggestedQuery}">
                <p>Did you mean <g:link controller="producto" action="search" params="[q: searchResult.suggestedQuery]">${StringQueryUtils.highlightTermDiffs(params.q.trim(), searchResult.suggestedQuery)}</g:link>?</p>
              </g:if>

              <g:if test="${parseException}">
                <p>Your query - <strong>${params.q}</strong> - is not valid.</p>
                <p>Suggestions:</p>
                <ul>
                  <li>Fix the query: see <a href="http://lucene.apache.org/java/docs/queryparsersyntax.html">Lucene query syntax</a> for examples</li>
                  <g:if test="${LuceneUtils.queryHasSpecialCharacters(params.q)}">
                    <li>Remove special characters like <strong>" - [ ]</strong>, before searching, eg, <em><strong>${LuceneUtils.cleanQuery(params.q)}</strong></em><br />
                      <em>Use the Searchable Plugin's <strong>LuceneUtils#cleanQuery</strong> helper method for this: <g:link controller="searchable" action="index" params="[q: LuceneUtils.cleanQuery(params.q)]">Search again with special characters removed</g:link></em>
                    </li>
                    <li>Escape special characters like <strong>" - [ ]</strong> with <strong>\</strong>, eg, <em><strong>${LuceneUtils.escapeQuery(params.q)}</strong></em><br />
                      <em>Use the Searchable Plugin's <strong>LuceneUtils#escapeQuery</strong> helper method for this: <g:link controller="searchable" action="index" params="[q: LuceneUtils.escapeQuery(params.q)]">Search again with special characters escaped</g:link></em><br />
                      <em>Or use the Searchable Plugin's <strong>escape</strong> option: <g:link controller="producto" action="search" params="[q: params.q, escape: true]">Search again with the <strong>escape</strong> option enabled</g:link></em>
                    </li>
                  </g:if>
                </ul>
              </g:if>
              <table>
                <tbody>
              <g:if test="${haveResults}">
                <div class="list">
                  <g:each var="result" in="${searchResult.results}" status="index">
                    <tr class="${(index % 2) == 0 ? 'even' : 'odd'}">

                      <td>
                    <g:link action="show" id="${result.id}">
                      <img width="15%" height="15%" alt="Img" src="http://localhost:7070/GrailsApplication2/producto/showImage/${result.id}">
                    </g:link>
                    </td>



                    <td>${fieldValue(bean: result, field: "nombre")}</td>
                    </tr>
                  </g:each>
                </div>
              </tbody>
              </table>

                <div>
                  <div class="paging">
                    <g:if test="${haveResults}">
                      Pág.:
                      <g:set var="totalPages" value="${Math.ceil(searchResult.total / searchResult.max)}" />
                      <g:if test="${totalPages == 1}"><span class="currentStep">1</span></g:if>
                      <g:else><g:paginate controller="producto" action="search" params="[q: params.q]" total="${searchResult.total}" prev="&lt; previous" next="next &gt;"/></g:else>
                    </g:if>
                  </div>
                </div>

              </g:if>
            </ul>
          </div>
        </div>
      </div>    
    </div>
  </section>
</body>
</html>
