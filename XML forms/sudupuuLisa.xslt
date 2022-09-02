<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="xml" encoding="utf-8" indent="yes"/>
  <xsl:template match="/">
    <strong>
    1. Kõik nimed sünnaastate järjekorras
    </strong>
        <ul>
          <xsl:for-each select="//inimene">
            <xsl:sort select="synniaasta"/>
            <li>
              <xsl:value-of select="concat(nimi, ', ', synniaasta)"/>
            </li>
          </xsl:for-each>
        </ul>
    >------
    <ul>
      <xsl:for-each select="//inimene">
        <xsl:sort select="@synd"/>
        <li>
          <xsl:value-of select="concat(nimi, ', ', @synd)"/>
        </li>
      </xsl:for-each>
    </ul>
    <strong>
      2. Näidata lastele tema vanema
    </strong>
    <xsl:for-each select="//inimene">
      <xsl:sort select="synniaasta"/>
      <li>
        <xsl:value-of select="nimi"/>
        <xsl:if test="../.."/>
        - lapsevanem
        <xsl:value-of select="../../nimi"/>
      </li>
    </xsl:for-each>
    <strong>
      3. Näitame iga vahemale lapsete kogus
    </strong>
    <xsl:for-each select="//inimene[lapsed]">
      <xsl:sort select="lapsed/inimene/synniaasta" order="descending"/>
      <li>
        <xsl:value-of select="nimi"/>
       , 
       <xsl:value-of select="count(lapsed/inimene)"/>
        <xsl:if test="count(lapsed/inimene)=1">
        - laps
        </xsl:if>
        <xsl:if test="not(count(lapsed/inimene)=1)">
        - last
        </xsl:if>
      </li>
    </xsl:for-each>
    <strong>
      4.
    </strong>
    <xsl:for-each select="//inimene[lapsed]">
      <li>
        <xsl:value-of select="nimi"/>
        :
        
        <xsl:for-each select="lapsed/inimene">
          <xsl:value-of select="nimi"/>,
        </xsl:for-each>

     </li>
     </xsl:for-each>
    <strong>
    CАмостоятельное задание
    </strong>
    <strong>
      1.  Вывести все года рождения людей
    </strong>
    <ul>
      <xsl:for-each select="//inimene">
        <xsl:sort select="synniaasta"/>
        <li>
          <xsl:value-of select="synniaasta"/>
        </li>
      </xsl:for-each>
    </ul>
    <strong>
      2.  Вывести все имена, у кого мин 2 ребенка
    </strong>
    <xsl:for-each select="//inimene[lapsed]">
      <xsl:sort select="lapsed/inimene/synniaasta" order="descending"/>
      <li>     
        <xsl:if test="count(lapsed/inimene)>=2">
          <xsl:value-of select="nimi"/>
        </xsl:if>      
      </li>
    </xsl:for-each>
    <strong>
      3.  вывести родословеную в виде таблицы 4,-5,6,-7
    </strong>
    <style>
table, th, td {
  border:1px solid black;
}
</style>
    <xsl:for-each select="//inimene[lapsed]">
      
    <table style="width:100%">
      <tr>
        <th>Nimi</th>
        <th>laps</th>
        <th>aasta</th>
        <th>aastat vana</th>
        
      </tr>
      
        
        
        <xsl:for-each select="lapsed/inimene">
          <tr>
            <td>
              <xsl:value-of select="nimi"/>
            </td>
        <td><xsl:value-of select="nimi"/></td>
        <td>
          <xsl:value-of select="synniaasta"/>
          
        </td>

          <td>
            <xsl:value-of select="2022-synniaasta" />
          </td>
          </tr>
        </xsl:for-each>



      </table>
    
    </xsl:for-each>
    <strong>7.   Väljasta iga inimese juures, mitmendal oma vanema sünniaastal ta sündis. </strong>
    <ul>
      <xsl:for-each select="//inimene">
        <xsl:sort select="synniaassta"/>
        <li>
          <xsl:value-of select="nimi"/>
          <xsl:if test="../..">
             , 
            <xsl:value-of select="../../synniaassta - synniaassta"/>
          </xsl:if>
        </li>
      </xsl:for-each>
    </ul>
    <strong>
      8. Искать в дереве все имена, содержащие определенное количество символов плюсом к поиску по буквам.
    </strong>
    <ul>
      <xsl:for-each select="//inimene">
        <xsl:if test="string-length(nimi)=13 and substring(nimi,1,1)='P'">
          <li>
            <xsl:value-of select="nimi"/>
          </li>
        </xsl:if>

      </xsl:for-each>
    </ul>
    </xsl:template>
</xsl:stylesheet>
