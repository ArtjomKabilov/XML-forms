<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" encoding="utf-8" indent="yes"/>

    <xsl:template match="/">
      
      Esimene inimene:
      <xsl:value-of select="/inimesed/inimene[1]/eesnimi"/>
      <br/>
      Viimane inimene:
      
      <xsl:value-of select="/inimesed/inimene[last()]/eesnimi"/>
      <br/>
       Esitäht:
       <xsl:value-of select="substring(/inimesed/inimene[last()]/eesnimi,1,1)"/>
      <br/>
      Oma initsialid:
      <xsl:value-of select="concat(
                    substring(/inimesed/inimene[1]/eesnimi,1,1),'.',
                    substring(/inimesed/inimene[1]/perenimi,1,1),'.')"/>
      <br/>
      Oma ees ja perenimi pikkus on:
      <xsl:value-of select="
                    string-length(/inimesed/inimene[1]/eesnimi)+
                    string-length(/inimesed/inimene[1]/perenimi)"/>
      <br/>
      Minu inimest on xml failist?
      <xsl:value-of select="count(/inimesed/inimene/eesnimi)"/>
      <br/>
      Mittu inimest on sündinud 2004 aastal?
      <xsl:value-of select="count(/inimesed/inimene[synd = 2004])"/>
      <br/>
      Mittu inimest on sündinud pärast 2003?
      <xsl:value-of select="count(/inimesed/inimene[synd &gt; 2003])"/>
      <br/>
      Kordused - näitame kõik perekonnanimed ja sünniaastad:
      <ul>
        <xsl:for-each select="/inimesed/inimene">
          <li>
            <xsl:value-of select="concat(perenimi,', ',synd)"/>
          </li>
          
        </xsl:for-each>
      </ul>
      <br/>
      1.Näidata kõik nimed mis algavad A tähega
      <xsl:for-each select="/inimesed/inimene[substring(eesnimi,1,1)='A']">
      <xsl:value-of select="eesnimi"/>

      </xsl:for-each>        
      <br/>
      2.Näita kõik viimased perenimi tähed:
      <xsl:value-of select="concat(
                    substring(/inimesed/inimene[1]/perenimi,7,7),', ',
                    substring(/inimesed/inimene[2]/perenimi,8,8), ', ',
                    substring(/inimesed/inimene[3]/perenimi,10,10),', ',
                    substring(/inimesed/inimene[4]/perenimi,7,7),', ',
                    substring(/inimesed/inimene[5]/perenimi,8,8))">
      
      </xsl:value-of>
      <br/>
      3.Прибавь кольчетсво букв имени 1 к имени 2:
      
      <xsl:value-of select="
                    string-length(/inimesed/inimene[1]/eesnimi)+
                    string-length(/inimesed/inimene[2]/eesnimi)"/>
    <br/>
    </xsl:template>
</xsl:stylesheet>
