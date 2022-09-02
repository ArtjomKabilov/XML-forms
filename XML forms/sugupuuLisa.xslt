<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="@* | node()">
      <strong> 1. Kõik nimed sünniaastate järjekorras</strong> 
        <ul>
          <xsl:for-each select="//inimene">
            <xsl:sort select="synniaassta"/>
            <li>
              <xsl:value-of select="concat(nimi,' (',synniaassta,')')"/>
            </li>
          </xsl:for-each>
        </ul>
      --------------------------
      <ul>
        <xsl:for-each select="//inimene">
          <xsl:sort select="@synd"/>
          <li>
            <xsl:value-of select="concat(nimi,' (',@synd,')')"/>
          </li>
        </xsl:for-each>
      </ul>
      <strong>2. Näidata lastele tema vanema</strong>
      <ul>
        <xsl:for-each select="//inimene">
          <xsl:sort select="synniaassta"/>
          <li> 
            <xsl:value-of select="nimi"/>  
            <xsl:if test="../..">
              - lapsevanem
            <xsl:value-of select="../../nimi"/>              
            </xsl:if>
          </li>
        </xsl:for-each>
      </ul>
      <strong>3. Näitame liga vanemale lapsete kogus</strong>
      <ul>
        <xsl:for-each select="//inimene[lapsed]">
          <xsl:sort select="lapsed/inimene/synniaassta" order="descending"/>
          <li>
            <xsl:value-of select="nimi"/>, 
            <xsl:value-of select="count(lapsed/inimene)"/>
            <xsl:if test="not(count(lapsed/inimene)=1)">
              - last
            </xsl:if>
            <xsl:if test="count(lapsed/inimene)=1">
              - laps
            </xsl:if>
          </li>
        </xsl:for-each>
      </ul>
      <strong>-----Vanem: laps1. laps2, ...</strong>
      <ul>
        <xsl:for-each select="//inimene[lapsed]">
          <li>
            <xsl:value-of select="nimi"/>:
            <xsl:for-each select="lapsed/inimene">
              <xsl:value-of select="nimi"/>; 
            </xsl:for-each>
          </li>
        </xsl:for-each>
      </ul>
      ----------------------------------------
      <strong>Ülessanned</strong><br></br>
      <strong>1. Trüki välja kõikide inimeste sünniaastad</strong>
      <ul>
        <xsl:for-each select="//inimene">
          <xsl:sort select="@synd"/>
          <li>
            <xsl:value-of select="@synd"/>
          </li>
        </xsl:for-each>
      </ul>
      <strong>2. Väljastatakse nimed, kel on vähemalt kaks last</strong>
      <ul>
        <xsl:for-each select="//inimene[lapsed]">
          <xsl:sort select="lapsed/inimene/synniaassta" order="descending"/>
          <li>
            <xsl:if test="count(lapsed/inimene) &gt;= 2 ">
            <xsl:value-of select="nimi"/>,
            <xsl:value-of select="count(lapsed/inimene)"/>
              - last
            </xsl:if>
          </li>
        </xsl:for-each>
      </ul>
      <strong>3. Väljasta sugupuus leiduvad andmed tabelina</strong><br></br>
      <strong>4.  Kus võimalik, seal väljasta tabelis iga inimese vanema nimi</strong><br></br>
      <strong>5.   Väljasta tabelis ka vanavanema nimi</strong><br></br>
      <strong>6.   Выводить в  таблице возраст каждого ребенка</strong><br></br>
      <strong>10. Tabelis kõik nimed pikkusega &lt; 8 värvida (taustavärv) roheliseks </strong><br></br>
      <br></br>
      <table border="1">
        <tr>
          <th>Nimi</th>
          <th>Vanem</th>
          <th>Vanavanema</th>
          <th>Vanus</th>
        </tr>
        <xsl:for-each select="//inimene">
          
              <tr>
                  <xsl:choose>
                  <xsl:when test="string-length(nimi) &lt; 8">
                    <td bgcolor="lightgreen"><xsl:value-of select="nimi"/>
                    </td>
                  </xsl:when>
                  <xsl:otherwise>
                    <td>
                    <xsl:value-of select="nimi"/>
                    </td>
                  </xsl:otherwise>
                  </xsl:choose>
                <td>
                  <xsl:value-of select="../../nimi"/>
                </td>
                <td>
                  <xsl:value-of select="../../../../nimi"/>
                </td>
                <td>
                  <xsl:choose>
                    <xsl:when test="substring(nimi,1,2)='El'">
                      ---
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="2022-@synd"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>

        </xsl:for-each>
      </table><br></br>
      
      
      <strong>7.   Väljasta iga inimese juures, mitmendal oma vanema sünniaastal ta sündis. </strong>
      <ul>
        <xsl:for-each select="//inimene">
          <xsl:sort select="synniaassta"/>
          <li>
            <xsl:value-of select="nimi"/>
            <xsl:if test="../..">
              - lapsevanem
              <xsl:value-of select="../../synniaassta - synniaassta"/>
            </xsl:if>
          </li>
        </xsl:for-each>
      </ul>
      <strong>8. Искать в дереве все имена, содержащие определенное количество символов плюсом к поиску по буквам. 13 символов и начинается на P</strong>
      <ul>
        <xsl:for-each select="//inimene">
            <xsl:if test="string-length(nimi)=13 and substring(nimi,1,1)='P'">
                        <li><xsl:value-of select="nimi"/></li>
            </xsl:if>
            
        </xsl:for-each>
      </ul>
      <strong>
        9. Andmepuus muudetakse sünniaasta atribuudiks.
      </strong>
        <ul>
          <xsl:for-each select="//inimene">
            <xsl:sort select="@synd"/>
            <li>
              <xsl:value-of select="concat(nimi,' (',@synd,')')"/>
            </li>
          </xsl:for-each>
        </ul>

    </xsl:template>
</xsl:stylesheet>
