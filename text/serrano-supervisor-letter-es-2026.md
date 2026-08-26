---
sha256: f1f51f08e23bf213c7bc10a4b88afff5616f2da042ff73578b980193c1be21e2
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 22385
---
SeguroParamétricodeCostosdeCambioparaTrabajadores
DigitalesLatinoamericanosSubatendidosCobertura
medianteInstrumentosOn-Chain
Registro de Iteraciones Cerradas y Solicitud de Lineamientos Metodológicos
d2
nance
github.com/wvs-finance
2026-05-06
1. Motivación, problema, solución sugerida, retos
Motivación. Estudiamos a los trabajadores digitales latinoamericanos remunerados en pesos
colombianos que contraen obligaciones recurrentes denominadas en dólares por concepto
de insumos profesionales (servicios de IA por suscripción, tarifas de uso de API, cómputo
en la nube y gasto en software como servicio); se trata de una población cuya exposición al
riesgo macroeconómico está dominada por la volatilidad cambiaria. Para el caso colombiano
en particular, el mercado cambiario funciona como agregador eciente de los choques
macroeconómicos, mientras que los rendimientos de los TES y la inación básica operan
como variables seguidoras de la trayectoria del COP/USD (Rincón-Torres et al., 2021, 2023;
Rincón-Castro et al., 2021; Fuentes et al., 2014); el mismo patrón de transmisión cambiaria
como canal primario está documentado de manera general para los mercados emergentes
(Calvo and Reinhart, 2002; Rey, 2015; Bruno and Shin, 2015).
Problema. Cuando el COP se debilita frente al USD, la línea de costos denominada en dólares
se traduce en un gasto no presupuestado en pesos. La práctica actual de gestión de riesgo
para esta población es indirecta: acumulación de USD mediante productos de ahorro en
dólares de neobancos (por ejemplo, Littio, Global66, el piloto de billetera en USD de
Nubank) y tenencias informales de divisas, en lugar de una cobertura directa y convexa
sobre la trayectoria del COP/USD. Hasta donde el proyecto ha podido establecer, ningún
producto de la banca minorista o ntech colombiana ofrece actualmente un contrato de
seguro paramétrico de costos al estilo de una opción de compra (call) cambiaria a los
nocionales mensuales de cientos a pocos miles de dólares que estos trabajadores manejan;
los sustitutos indirectos no cobran una prima explícita por convexidad y no otorgan derecho
de cobro frente a un umbral cambiario. Invitamos al profesor a señalar cualquier producto
que el proyecto haya pasado por alto en este barrido.
Soluciónsugerida. Identicamos los riesgos macroeconómicos X que producen cuantitativamenteMemorando de Revisión por el Profesor May 7, 2026
estos choques de costos, los validamos empíricamente y diseñamos productos de seguro
paramétrico de costos que compensan la exposición al traspaso cambiario (Carter et al.,
2017; Mahul and Stutley, 2010; Clarke, 2016). El patrón de demanda al que apuntamos
 hogares de países subatendidos que adquieren un seguro contra devaluación bajo la
forma de una opción de compra (call) sobre el tipo de cambio  está documentado en
una entrevista reciente con un profesional del sector (Leifke, 2026): the instrument that
people really care about, especially in emerging markets, is more of like a devaluation
insurance policy . . . call options are kind of perfect for this because you don't need a credit
relationship. You just pay a premium upfront.
1
El producto de intermediación compensa
al trabajador en una unidad que efectivamente gasta (COP, o un stablecoin de paridad
de poder adquisitivo anclado al COP); el lugar de implementación es la infraestructura de
liquidación on-chain (descrita en el documento técnico complementario de 37 páginas, 4)
y no la primitiva económica.
Retos.
 Postura de identicación  predictiva frente a causal (véase 4.2).
 Suciencia del payo convexo bajo el estándar de suscripción aseguradora (véase 4.2).
 Calibración diferencial multi-Y ; corrección por tasa de error por familia frente a tasa
de descubrimientos falsos a través de los brazos (véase 4.2).
 Defensibilidad del protocolo anti-fishing  umbrales de pre-registro NMIN = 75,
POWERMIN = 0.80, MDESSD = 0.40 (véase 4.2).
 Tasa de error por familia entre iteraciones y sesgo de selección de iteraciones (véase
4.2).
Puentehacia2. A la fecha hemos ejecutado cuatro iteraciones, todas cerradas o pausadas; las
especicaciones del modelo, los resultados y los post-mortem de las fallas se presentan en
la Sección 2. (Una quinta iteración  Pareja D, sobre el empleo de trabajadores jóvenes
colombianos en el agregado de servicios amplios  cerró en PASS pero se omite aquí
por ortogonalidad de población: su población objetivo es el empleo BPO de trabajadores
jóvenes y no la población digital expuesta al choque de costos por traspaso cambiario que
ocupa la presente carta; el registro de esa iteración se conserva en el documento técnico
complementario de 37 páginas y en la memoria del proyecto.)
2. Cuatro iteraciones
Etapa1dev-AISecciónJTICmedianterezagoCOP/USD(FAIL). Trabajadores
jóvenes colombianos (1428 años) restringidos a la Sección J del CIIU Rev. 4 (Información y
1
Traducción libre: el instrumento que de verdad le importa a la gente, especialmente en mercados emergentes,
se parece más a una póliza de seguro contra devaluación; las opciones de compra resultan idóneas porque no se
requiere una relación crediticia y basta con pagar una prima por adelantado.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 2 built May 7, 2026Memorando de Revisión por el Profesor May 7, 2026
Comunicaciones, Divisiones 5863), con cadencia mensual, factores de expansión FEX_C_2018 y
el panel de rezagos detallado a continuación.
Yt = α + β6 Xt−6 + β9 Xt−9 + β12 Xt−12 + εt
donde Yt = logit(shareJ
t ) y Xt−k = log(COP/USDt−k); pre-registrada H1 : βcomposite > 0.
Datos. Fuente: microdatos GEIH del DANE restringidos a la Sección J del CIIU Rev. 4
(Divisiones 5863); TRM del Banrep. Frecuencia: mensual. Ventana: 2015-01-31 hasta
2026-03-31. Muestra: N = 134 observaciones mensuales. Transformaciones: logit sobre la
participación de la Sección J; nivel logarítmico sobre el tipo de cambio; mismo panel de rezagos
que la Pareja D; HAC(L = 12); FEX_C_2018; diagnóstico de sesgo residual de empalme en la
frontera Marco-2018 entre 2020-12 y 2021-01. Repositorio:notebooks/dev_ai_cost. Shade
laespecicación: 7c72292516...751f5a. Resultado. β̂composite = −0.14613, SE HAC 0.0847,
t = −1.726, p ≈ 0.958 a una cola contra H1 : β > 0; clasicador R MIXED (3 de 4 las R
coinciden en signo negativo). Interpretación. FAIL  con signo invertido en el corte estrecho
de la Sección J. Razón del rechazo. El sustrato de la Sección J no exhibe el patrón de traspaso
cambiario rezagado al empleo que la narrativa de tercerización BPO presuponía; emergió un
sesgo residual de empalme (el diagnóstico de frontera de la Fase 1 reportó un salto de +0.375
en el logit-Y en la frontera Marco-2018 entre 2020-12 y 2021-01 frente a una envolvente de
±0.335), de modo que el cambio de nivel posterior a 2021 no queda plenamente neutralizado en
el corte de la Sección J. El brazo de sensibilidad R2 Sección M (Secciones 6975 del CIIU) arrojó
β̂composite = +0.45482801, t = +4.73, p = 1.13 × 10−6, pero este es un objeto candidato para la
próxima iteración no pre-registrado, no un PASS graduado, y el rechazo en la Sección J falsea el
diseño del instrumento por usuario que la población pagadora de dev-AI habría sostenido.
SorpresadeIPCyvol-cambiariaIPCcolombianomediantevolatilidadrealizada
de la TRM (FAIL). Empresas colombianas y receptores de remesas con exposición a la
volatilidad cambiaria sobre el COP/USD en torno a la publicación del IPC del DANE, en cadencia
semanal con anclaje el viernes, donde Yw es la volatilidad realizada semanal del panel de retornos
logarítmicos diarios de la TRM del Banrep y la regresora es la sorpresa de IPC AR(1) rmada
y rezagada.
RVCOP/USD
w = α + β SurpCPI
w−1 + εw
donde RVw es la volatilidad realizada en la semana w y SurpCPI
w−1 es la sorpresa mensual rmada
del IPC AR(1) rezagada y mapeada a cadencia semanal (mantenida durante la semana de
publicación, cero en otro caso), con un conjunto reducido de controles de sorpresa macroeconómica
en la principal. Datos. Fuente: panel diario de retornos logarítmicos de la TRM del Banrep;
calendario de publicación del IPC del DANE más valores realizados para la construcción de la
sorpresa AR(1). Frecuencia: semanal (anclaje el viernes). Ventana: 2008-01-02 hasta 2026-
02-23. Muestra:N = 947 observaciones semanales. Transformaciones:RV semanal a partir
de retornos logarítmicos diarios; sorpresa de IPC AR(1) rmada mapeada a cadencia semanal
(mantenida durante la semana de publicación, cero en otro caso); errores estándar Newey-
West HAC(4); conjunto reducido de controles de sorpresa macroeconómica. Repositorio:
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 3 built May 7, 2026Memorando de Revisión por el Profesor May 7, 2026
notebooks/fx_vol_cpi_surprise. Huelladelaespecicación:nb1_panel_fingerprint.json.
Resultado. β̂CPI = −0.000685, SE HAC(4) 0.001794, intervalo al 90% [−0.003636, +0.002266]
que contiene cero; el criterio de compuerta β̂ − 1.28 · c SE = −0.002981 < 0 dispara el FAIL.
Interpretación. FAIL  ninguna respuesta de la RV semanal a las sorpresas de IPC. Razón del
rechazo y salvedad de sensibilidad. La prueba T1 de exogeneidad pre-registrada se rechaza con
F = 15.12, p ≈ 1.3×10−9, de manera que la iteración constituye una regresión predictiva en lugar
de una estructural-causal y β̂ no puede leerse como una respuesta a impulso. Dos sensibilidades
pre-registradas devolvieron intervalos al 90% signicativos y positivos bajo la convención de
α = 0.05 a una cola  A1 cadencia mensual β̂ = +0.0152 sobre [+0.0057, +0.0246]; A4
con exclusión del día de publicación β̂ = +0.0033 sobre [+0.0005, +0.0062] , pero ninguna
constituye el hallazgo principal de la iteración: la principal semanal pre-registrada es el resultado,
y A1/A4 quedan como insumos candidatos para una posible especicación principal futura de
cadencia mensual antes que como un rescate de la principal semanal.
FaseA.0RemesasCorredorderemesascolombianomedianteeltipodecambio
(EXIT_NON_REMITTANCE). Hogares colombianos receptores de remesas indexados
frente al corredor colombiano de remesas con traspaso cambiario, donde Yw se hereda del panel
semanal de vol-cambiaria y Xw−1 es un proxy candidato de ujos de remesas on-chain construido
a partir de la actividad agregada de usuarios de cCOP y COPm sobre Celo.
RVCOP/USD
w = α + β ∆RemitCol
w−1 + εw
donde ∆RemitCol
w−1 es la variación rezagada del ujo de remesas de hogares colombianos aproximada
por la actividad on-chain en Celo, particionada para intentar aislar las remesas de hogar de la
actividad de DEX de terceros, el roundtripping de tesorería y el arbitraje por bots. Datos.
Fuente (planeada): remesas mensuales del Banrep + actividad agregada de usuarios on-
chain de cCOP / COPm en Celo. Frecuencia: semanal (planeada; nunca alcanzó el N
nal). Ventana: 2024-09 hasta 2026-04 (planeada). Muestra: no producida  salida pre-
estimación. Transformaciones:regla de partición pre-registrada para remesas de hogar frente
a actividad de DEX de terceros, roundtripping de tesorería y arbitraje por bots; nunca ejecutada.
Especicación:docs/specs/2026-04-20-remittance-surprise-trm-rv-design.md (sin directorio
de notebook  la especicación salió pre-estimación). Cadenadeespecicación: Fase A.0
Rev 4.1 (con criterios de cierre). Resultado. No se produjo estimación empírica  salida por
criterios de cierre pre-estimación el 2026-04-24. Interpretación. EXIT  nunca se estimó; cerrada
por k1 + parcial-k2. Razón de la salida. La investigación de eventos del Eje 1 de la Tarea 11.F
arrojó cero de treinta ujos de día pico identicables como remesa, con aproximadamente el
87% del ujo examinado descomponiéndose en arbitraje sobre TRM, roundtripping de tesorería,
campañas y actividad de bots; la actividad agregada de usuarios de cCOP/COPM en Celo es
volumen de DEX de terceros, no remesas de hogares colombianos, así que ningún ltro post-hoc
podría reconstruir un X-driver que jamás se midió aguas arriba. La salida es estructural para la
disciplina de criterios de cierre: en ausencia del EXIT pre-registrado, la iteración de ltros sin
freno del plan rev-4 habría corrido hacia un ltro que aparentaría rescatar una señal que nunca
se capturó.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 4 built May 7, 2026Memorando de Revisión por el Profesor May 7, 2026
P1 Bittensor SN18  Aparato de estudio de eventos (PARKED). La población
expuesta a choques de política sobre IA propietaria (desarrolladores LATAM que pagan APIs de
IA denominadas en dólares como candidato aguas abajo; el aparato es anterior al estrechamiento
de la población objetivo), con Yt un indicador de estudio de eventos sobre el alfa de Bittensor SN18
(Cortex.t) y Xt un conjunto de fechas de eventos de política pre-jadas (halving de Bittensor
2025-12-15; activación de la mainnet de dTAO 2025-02-13; hitos de Cortex.t).
ARi,τ = αi +
+L X
τ=−L
γτ 1{ti + τ ∈ E} + εi,τ
donde ARi,τ es el indicador de alfa anormal en la ventana de evento al tiempo relativo τ para
el evento i, E es el conjunto pre-jado de eventos de política, y el aparato se evalúa sobre
un cubo de veredicto de nueve celdas (elegibilidad de veredicto cruzada con consistencia de
robustez), con corrección Bonferroni en αprimary = 0.0167 sobre la familia conjuntiva P1+P2+P3
con Nevents
min = 8 y una compuerta de placebo asimétrica. Datos. Fuente: estudio de eventos
sobre el alfa de Bittensor SN18 (Cortex.t); fechas de eventos de política pre-jadas (halving de
Bittensor 2025-12-15; mainnet de dTAO 2025-02-13; hitos de Cortex.t). Frecuencia: ventana
de evento (L asimétrico). Ventana: ±L por evento. Muestra: planeada Nevents
min = 8; ingesta
de datos diferida. Transformaciones:indicador de alfa anormal en ventana de evento; cubo de
veredicto de nueve celdas; Bonferroni en αprimary = 0.0167 sobre P1+P2+P3. Especicación:
docs/specs/2026-04-27-p1-sn18-event-study-design.md (sin directorio de notebook  aparato
pausado pre-ingesta). Shadelaespecicación:f855e036d3...b47aeab. Resultado. Ninguno
 aparato pausado para registro el 2026-04-27; no se produjo armación empírica graduada.
Interpretación. PARKED  aparato completo, ninguna armación graduada. Razón de la
pausa. Aparato completo; ninguna armación empírica graduada. El usuario pivotó hacia la vía
rápida del β compuesto simple (Pareja D, Etapa 1 dev-AI) y pausó P1 para preservar el capital
intelectual del trabajo de especicación, con las condiciones de reactivación documentadas en la
memoria de pausa.
3. Encuadre del riesgo objetivo
El riesgo objetivo es la exposición a la volatilidad cambiaria para una población especíca:
trabajadores digitales latinoamericanos remunerados en pesos colombianos (ujos de caja en
COP) pero con obligaciones recurrentes denominadas en dólares por concepto de insumos profesionales.
Cuando el COP se debilita frente al USD, la línea de costos denominada en dólares se traduce en
un incremento no presupuestado del gasto en pesos. El producto de intermediación objetivo es un
contrato que compensa este choque de costos por traspaso cambiario, denominado en una unidad
que el trabajador efectivamente gasta (COP, o un stablecoin de paridad de poder adquisitivo
anclado al COP). El encuadre abstracto del Lema de Abrigo Yinequality(t) = Ra(t) − Rc(t) 
presente en el documento técnico complementario de 37 páginas, 3  es la generalización
analítica eventual; la carta (documento de entrada) introduce únicamente el objetivo concreto.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 5 built May 7, 2026Memorando de Revisión por el Profesor May 7, 2026
4. Solicitudes al profesor
4.1 Especicaciones sugeridas
Invitamos al profesor a sugerir el par (Y,X), la estructura de rezagos, la ventana muestral,
la convención de inferencia principal y los brazos de robustez para la próxima iteración. En
particular: cuál corte sectorial debería seguir al rechazo en la Sección J de dev-AI a la luz de
la señal de sensibilidad R2 Sección M (Secciones 6975 del CIIU Rev. 4: consultoría, cientícos,
administrativos); si conviene repetir la principal de sorpresa de IPC y vol-cambiaria en la cadencia
mensual A1 como el próximo pre-registro; o si conviene pivotar hacia un panel LATAM no
colombiano.
4.2 Riesgos
Las viñetas siguientes son riesgos que el proyecto ya ha identicado; solicitamos al profesor
agregar riesgos que no hayamos señalado.
 Postura de identicación  regresión predictiva frente a estructural-causal; T1 de exogeneidad
rechazada en vol-cambiaria; HAC con L jo por iteración.
 Suciencia del payo convexo bajo el estándar de suscripción aseguradora  la media de
β̂ es necesaria pero no suciente; Carter et al. (2017), Mahul and Stutley (2010) y Clarke
(2016) jan los estándares.
 Calibración diferencial multi-Y  correlación conjunta entre brazos, FWER frente a FDR,
cambio de régimen.
 Defensibilidad del protocolo anti-fishing  NMIN = 75, POWERMIN = 0.80, MDESSD =
0.40 heredados de la Fase A.0 Rev-5.3.1, no re-derivados.
 FWER entre iteraciones y sesgo de selección de iteraciones  cinco iteraciones cerradas
en el conjunto del proyecto (cuatro presentadas en esta carta más la Pareja D omitida por
ortogonalidad de población); preocupación de comparación múltiple a nivel meta; Heckman
(1979) como marco candidato.
 Sesgo de Stambaugh en muestra pequeña sobre regresiones predictivas con regresor persistente
 Stambaugh (1999), Phillips (2014); el log-FX está cerca de raíz unitaria en frecuencia
mensual.
 Sesgo residual de empalme  la ruptura metodológica del Marco-2018 del DANE no queda
plenamente neutralizada; emergió en la Etapa 1 dev-AI NB02 Trío 1, anomalía de frontera.
4.3 Bibliografía
La bibliografía actual está documentada en el Apéndice B del documento complementario de 37
páginas y se reproduce en refs.bib. Invitamos al profesor a recomendar referencias adicionales
que considere estructurales para el trabajo empírico del marco, en particular sobre (a) jación de
precios de seguros paramétricos basados en índices en poblaciones con baja calicación crediticia
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 6 built May 7, 2026Memorando de Revisión por el Profesor May 7, 2026
de contraparte, (b) regresiones predictivas de la participación sectorial del empleo sobre paneles
de tipo de cambio real efectivo, y (c) regímenes de corrección de tasa de descubrimientos falsos
entre iteraciones para pre-registro observacional.
4.4 Conexiones
Invitamos al profesor a presentar el proyecto a otros investigadores, profesionales del sector o
instituciones cuyo trabajo pueda complementar este conjunto de iteraciones, incluyendo, sin
limitarse a ello, suscriptores de seguros paramétricos con exposición LATAM, operadores de
derivados cambiarios al servicio de nocionales sub-corporativos, ingenieros de liquidación on-
chain y econometristas aplicados que trabajen sobre desindustrialización prematura en América
Latina. El trabajo empírico del marco está abierto a la colaboración; la red del profesor es el
canal más eciente para identicar contribuyentes complementarios.
References
Valentina Bruno and Hyun Song Shin. Cross-border banking and global liquidity. The Review
of Economic Studies, 82(2):535564, 2015.
Guillermo A. Calvo and Carmen M. Reinhart. Fear of oating. The Quarterly Journal of
Economics, 117(2):379408, 2002.
Michael R. Carter, Alain de Janvry, Elisabeth Sadoulet, and Alexandros Sarris. Index insurance
for developing country agriculture: A reassessment. World Development, 94:199216, 2017.
Daniel J. Clarke. A theory of rational demand for index insurance. American Economic Journal:
Microeconomics, 8(1):283306, 2016.
Miguel Fuentes, Pablo Pincheira, Juan Manuel Julio, Hernán Rincón, Santiago García-Verdú,
Miguel Zerecero, Marco Vega, Erick Lahura, and Ramon Moreno. The eects of intraday
foreign exchange market operations in Latin America: results for Chile, Colombia, Mexico
and Peru. Borradores de Economía 849, Banco de la República, Bogotá, 2014. Co-indexed as
BIS Working Paper No. 462.
James J. Heckman. Sample selection bias as a specication error. Econometrica, 47(1):153161,
1979. doi: 10.2307/1912352.
Robert Leifke. Builder stories: Inside numo. Interview, Atrium Academy (YouTube), https:
//www.youtube.com/watch?v=-nPTjKRMSK8&t=1115s, March 2026. Streamed live 2026-03-18.
Quote on emerging-market demand for FX-depreciation insurance as a call option at 18:35
19:20.
Olivier Mahul and Charles J. Stutley. Government Support to Agricultural Insurance: Challenges
and Options for Developing Countries. World Bank, Washington, DC, 2010.
Peter C. B. Phillips. On condence intervals for autoregressive roots and predictive regression.
Econometric Theory, 30(3), 2014.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 7 built May 7, 2026Memorando de Revisión por el Profesor May 7, 2026
Hélène Rey. Dilemma not trilemma: The global nancial cycle and monetary policy
independence. NBER Working Paper No. 21162, 2015.
Hernán Rincón-Castro, Norberto Rubiano-López, Julián Yaya-Garzón, and Héctor Zárate-
Solano. Traspaso de la tasa de cambio a la inación básica en Colombia. Borradores de
economía, Banco de la República, Bogotá, 2021.
Andrés Rincón-Torres, Nicolás Rojas-Silva, and Juan Manuel Julio-Román. The interdependence
of FX and Treasury bonds markets: The case of Colombia. Borradores de Economía 1171,
Banco de la República, Bogotá, 2021.
Andrés Rincón-Torres, Daniel De la Hortúa-Pulido, Nicolás Rojas-Silva, and Juan Manuel Julio-
Román. The low frequency eect of macroeconomic news on Colombian government bond
yields. Borradores de economía, Banco de la República, Bogotá, 2023.
Robert F. Stambaugh. Predictive regressions. Journal of Financial Economics, 54(3), 1999.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 8 built May 7, 2026