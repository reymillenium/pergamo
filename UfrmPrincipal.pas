unit UfrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, Buttons, Grids, DBGrids,
  ImgList, DBCtrls, ExtCtrls, Mask, ToolWin, CheckLst, AppEvnts, StrUtils,
  XPMan, ActnMan, ActnCtrls, XPStyleActnCtrls, ActnList, Math, MMSystem,
  ShellApi, DB, Winsock, OleCtrls, Sockets, RpRender,
  RpRenderPDF, RpBase, RpSystem, RpDefine, ExtDlgs, ERombBtn,
  ATImageBox, dsZoomNavigator, LbButton, CollapsePanel,

  cbClasses,
  CaptionButton,
  FormTrayIcon,
  FormRoller,
  FormTopmost,
  mxCaptionBarButtons,
  LbStaticText,
  LbSpeedButton,
  PJMenuSpeedButtons,
  RpRave,
  ExportPack,
  BcCustomDrawModule,
  BarMenus,
  XiPanel,
  CabSTComps,
  BcDrawModule,
  AdvPageControl,
  XiButton,
  CustomizeGrid,

  //Sirve para poder usar el portapapeles
  ClipBrd,

  //Trabajo con imagenes
  jpeg, PixTwixLib_TLB,


  {Units controladoras confeccionadas por mi.}
  UGestionDocente,


  {DataModules confeccionados por mi.}
  UDataModuleConexionGeneral,
  UDataModuleControlDelSistema,
  UDataModuleInformes,


  //para poder hacer consultas en la BD desde la aplicacion
  ADODB,



  {Units interfaz confeccionadas por mi.}
  UfrmAcercaDe,
  UfrmValidacionPuestoDeTrabajo,
  UfrmNuevoPuestoDeTrabajo,
  UfrmModificarPuestoDeTrabajo,
  UfrmDetallesDeTrazaDelSistema,
  UfrmNuevaPlanilla1164_01,
  UfrmModificarPlanilla1164_01,
  UfrmSumatoriaPlanillas1164_01PorAnno,
  
  {Units entidad confeccionadas por mi.}
  UPantalla,

  UFicheroIdioma,
  UFicheroAlineacionVisores,
  UFicheroTipoVisores,
  UFicheroZoomImagen,
  UFicheroComentarios,
  UFicheroPlanilla1164_01,
  
  UPuestoDeTrabajo,
  UPlanilla1164_01,
  

  //Reportes usando QuickReport
  UfrmQRReporteCuentasDeUsuarios,
  UfrmPreviewReporteCuentasDeUsuarios,

  UfrmQRReporteTrazasDelSistema,
  UfrmPreviewReporteTrazasDelSistema,

  UfrmQRReporteInformes1164_01,
  UfrmPreviewReporteInformes1164_01,

  UfrmQRReportePlanilla1164_01,
  UfrmPreviewReportePlanilla1164_01,

  UfrmQRReporteSumatoriaPlanillas1164_01PorAnno,
  UfrmPreviewReporteSumatoriaPlanillas1164_01PorAnno,


  
  FileCtrl,



  //Para dialogos en espa�ol (buena opcion, pero no agradable visualmente)
  Msgdlg,


  
  //Dialogs especiales, esquemas, etc (Message Master)
  MessDlgs, BiDiDBNavigator, DBAdvNavigator, AdvGlassButton, AdvCombo,
  ColCombo, AdvOfficePager, AdvOfficePagerStylers, AdvProgressBar,
  DBAdvGlowNavigator, AdvGroupBox, AdvOfficeButtons, AdvSpin, AdvEdit,
  AdvNavBar, AdvFontCombo, AdvSelectors, AdvOfficeComboBox,
  AdvOfficeSelectors, Lucombo, dblucomb, asgcombo, ColorCombo, AdvToolBar,
  AdvToolBarStylers, AdvMenus, AdvMenuStylers, BaseGrid, AdvGrid, DBAdvGrid,
  AdvGlowButton, AdvSmoothButton, AdvSmoothEdit, AdvSmoothEditButton,
  AdvSmoothDatePicker;



  {Formas confeccionadas por mi.}


  //AdvPageControl  AdvTabSet

type
  TfrmPrincipal = class(TForm)
    ApplicationEvents1: TApplicationEvents;
    ImageListArchivoHostalWare: TImageList;
    RvRenderPDF: TRvRenderPDF;
    SaveDialog: TSaveDialog;
    OpenPictureDialog: TOpenPictureDialog;
    SavePictureDialog: TSavePictureDialog;
    OpenDialog: TOpenDialog;
    ImageListEdicionHostalWare: TImageList;
    ImageListHerramientasHostalWare: TImageList;
    ImageListAyudaHostalWare: TImageList;
    ImageListVerHostalWare: TImageList;
    STCabReader: TSTCabReader;
    STCabWriter: TSTCabWriter;
    EXQR: TExportQR;
    AdvPageControlPrincipal: TAdvPageControl;
    AdvTabSheetControlDelSistema: TAdvTabSheet;
    AdvTabSheetInformesMES: TAdvTabSheet;
    ImageListGeneral: TImageList;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    OfficePagerInformesMES: TAdvOfficePager;
    AdvOfficePagePlanilla1164_01: TAdvOfficePage;
    lblFiltrarPlanillas1164_01PorProvincia: TLabel;
    lblCantidadPlanillas1164_01: TLabel;
    DBNavPlanillas1164_01: TDBAdvGlowNavigator;
    AdvGroupBox2: TAdvGroupBox;
    btnExportarHaciaPDFReportePlanillas1164_01: TLbButton;
    btnPrevisualizarReportePlanillas1164_01: TLbButton;
    AdvGroupBoxHuespedesRegistrados: TAdvGroupBox;
    AdvOfficePagerControlDelSistema: TAdvOfficePager;
    AdvOfficePageCuentasDeUsuario: TAdvOfficePage;
    AdvOfficePageTrazasDelSistema: TAdvOfficePage;
    AdvGroupBoxReporteCuentasDeUsuario: TAdvGroupBox;
    lblbtnExportarHaciaPDFReporteCuentasDeUsuario: TLbButton;
    lblbtnPrevisualizarReporteCuentasDeUsuario: TLbButton;
    AdvGroupBoxPuestosDeTrabajo: TAdvGroupBox;
    lblCantidadPuestosDeTrabajo: TLabel;
    DBTextSegundoApellido: TDBText;
    DBTextPrivilegios: TDBText;
    DBTextPrimerApellido: TDBText;
    DBTextNombre: TDBText;
    DBAdvGlowNavigatorCuentasDeUsuario: TDBAdvGlowNavigator;
    AdvGroupBoxReporteTrazasDelSistema: TAdvGroupBox;
    lblbtnExportarHaciaPDFReporteTrazasDelSistema: TLbButton;
    lblbtnPrevisualizarReporteTrazasDelSistema: TLbButton;
    AdvGroupBoxTrazasDelSistema: TAdvGroupBox;
    DBAdvGlowNavigatorTrazasDelSistema: TDBAdvGlowNavigator;
    cmbxFiltrarPlanillas1164_01PorProvincia: TAdvOfficeSelector;
    ToolBar1: TToolBar;
    AdvToolBarHostalWare: TAdvToolBar;
    AdvToolBarFantasyStyler: TAdvToolBarFantasyStyler;
    barbtnAcercaDe: TAdvToolBarButton;
    barbtnTemasDeAyuda: TAdvToolBarButton;
    MainMenu: TAdvMainMenu;
    MenuFantasyStyler: TAdvMenuFantasyStyler;
    MenuArchivo: TMenuItem;
    AdvToolBarSeparator1: TAdvToolBarSeparator;
    SubMenuSalir: TMenuItem;
    DBGridTrazasDelSistema: TDBAdvGrid;
    DBGridPuestosDeTrabajo: TDBAdvGrid;
    DBGridPlanillas1164_01: TDBAdvGrid;
    N1: TMenuItem;
    SubMenuDesconectar: TMenuItem;
    SubMenuImprimirReporteCuentasDeUsuario: TMenuItem;
    N2: TMenuItem;
    SubMenuExportarReporteCuentasDeUsuario: TMenuItem;
    MenuEdicion: TMenuItem;
    MenuVer: TMenuItem;
    MenuHerramientas: TMenuItem;
    MenuAyuda: TMenuItem;
    SubMenuTemasDeAyuda: TMenuItem;
    N3: TMenuItem;
    SubMenuAcercaDe: TMenuItem;
    SubMenuSalvarBaseDeDatos: TMenuItem;
    SubMenuAgregarCuentaDeUsuario: TMenuItem;
    SubMenuModificarCuentaDeUsuario: TMenuItem;
    SubMenuEliminarCuentaDeUsuario: TMenuItem;
    SubMenuVerReporteCuentasDeUsuario: TMenuItem;
    SubMenuVerDetallesDeTraza: TMenuItem;
    SubMenuExportarReporteTrazasDelSistema: TMenuItem;
    SubMenuImprimirReporteTrazasDelSistema: TMenuItem;
    SubMenuVerReporteTrazasDelSistema: TMenuItem;
    barbtnDesconectar: TAdvToolBarButton;
    AdvToolBarSeparator2: TAdvToolBarSeparator;
    barbtnSalvarBaseDeDatos: TAdvToolBarButton;
    SubMenuRestaurarBaseDeDatos: TMenuItem;
    barbtnRestaurarBaseDeDatos: TAdvToolBarButton;
    btnNuevaPlanilla1164_01: TAdvGlassButton;
    btnModificarPlanilla1164_01: TAdvGlassButton;
    btnEliminarPlanilla1164_01: TAdvGlassButton;
    lblbtnNuevaCuentaDeUsuario: TAdvGlassButton;
    lblbtnModificarCuentaDeUsuario: TAdvGlassButton;
    lblbtnEliminarCuentaDeUsuario: TAdvGlassButton;
    lblbtnDetallesDeTraza: TAdvGlassButton;
    btnExportarPlanillaHaciaFichero: TAdvGlassButton;
    btnImportarPlanillaDesdeFichero: TAdvGlassButton;
    FontDialog: TFontDialog;
    ckbxFiltrarPlanillas1164_01PorAnno: TAdvOfficeCheckBox;
    dtpAnno: TDateTimePicker;
    DBtxtID_Planilla1164_01: TDBText;
    DBtxtAnnoPlanilla1164_01: TDBText;
    DBtxtMunicipioPlanilla1164_01: TDBText;
    DBtxtNombreCentroInformantePlanilla1164_01: TDBText;
    btnBalanceAnualPlanillas1164_01: TAdvGlassButton;
    DBtxtProvinciaPlanilla1164_01: TDBText;
    SubMenuExportarReportePlanillas1164_01: TMenuItem;
    SubMenuImprimirReportePlanillas1164_01: TMenuItem;
    SubMenuAgregarPlanilla1164_01: TMenuItem;
    SubMenuModificarPlanilla1164_01: TMenuItem;
    SubMenuEliminarPlanilla1164_01: TMenuItem;
    SubMenuVerReportePlanillas1164_01: TMenuItem;
    SubMenuVerBalanceAnualDePlanillas1164_01: TMenuItem;
    SubMenuImportarPlanilla1164_01DesdeFichero: TMenuItem;
    SubMenuExportarPlanilla1164_01HaciaFichero: TMenuItem;
    SubMenuEdicionSeparacion01: TMenuItem;
    N5: TMenuItem;
    SubMenuOpcionesDeConfiguracion: TMenuItem;
    AdvOfficePageTempPlanilla1164_01: TAdvOfficePage;
    lblNombre: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblProvincia: TLabel;
    lblMunicipio: TLabel;
    lblAnnoParte1PlanillasProvinciales: TLabel;
    DBtxtID_MunicipioBuscado: TDBText;
    DBtxtMunicipio: TDBText;
    DBtxtAnno: TDBText;
    DBedtTotalXCantGradProfTP: TDBEdit;
    DBedtTotalXCantGradProfTC: TDBEdit;
    DBedtTotalXCantGradExtranjeros: TDBEdit;
    DBedtTotalXCantGradMujeres: TDBEdit;
    DBedtTotalXCantGradTotal: TDBEdit;
    DBedtTotalXCantParticipADistancia: TDBEdit;
    DBedtTotalXCantParticipUnivMun: TDBEdit;
    DBedtTotalXCantParticipProfTP: TDBEdit;
    DBedtTotalXCantParticipProfTC: TDBEdit;
    DBedtTotalXCantParticipExtranjeros: TDBEdit;
    DBedtTotalXCantParticipMujeres: TDBEdit;
    DBedtTotalXCantParticipTotal: TDBEdit;
    DBedtTotalXCantActivExtranjero: TDBEdit;
    DBedtTotalXCantActivADistancia: TDBEdit;
    DBedtTotalXCantActivUnivMun: TDBEdit;
    DBedtTotalXCantActivTotal: TDBEdit;
    DBedtSubTotal3XCantGradProfTP: TDBEdit;
    DBedtSubTotal3XCantGradProfTC: TDBEdit;
    DBedtSubTotal3XCantGradExtranjeros: TDBEdit;
    DBedtSubTotal3XCantGradMujeres: TDBEdit;
    DBedtSubTotal3XCantGradTotal: TDBEdit;
    DBedtSubTotal3XCantParticipADistancia: TDBEdit;
    DBedtSubTotal3XCantParticipUnivMun: TDBEdit;
    DBedtSubTotal3XCantParticipProfTP: TDBEdit;
    DBedtSubTotal3XCantParticipProfTC: TDBEdit;
    DBedtSubTotal3XCantParticipExtranjeros: TDBEdit;
    DBedtSubTotal3XCantParticipMujeres: TDBEdit;
    DBedtSubTotal3XCantParticipTotal: TDBEdit;
    DBedtSubTotal3XCantActivExtranjero: TDBEdit;
    DBedtSubTotal3XCantActivADistancia: TDBEdit;
    DBedtSubTotal3XCantActivUnivMun: TDBEdit;
    DBedtSubTotal3XCantActivTotal: TDBEdit;
    DBedtMaestriasXCantGradProfTP: TDBEdit;
    DBedtMaestriasXCantGradProfTC: TDBEdit;
    DBedtMaestriasXCantGradExtranjeros: TDBEdit;
    DBedtMaestriasXCantGradMujeres: TDBEdit;
    DBedtMaestriasXCantGradTotal: TDBEdit;
    DBedtMaestriasXCantParticipADistancia: TDBEdit;
    DBedtMaestriasXCantParticipUnivMun: TDBEdit;
    DBedtMaestriasXCantParticipProfTP: TDBEdit;
    DBedtMaestriasXCantParticipProfTC: TDBEdit;
    DBedtMaestriasXCantParticipExtranjeros: TDBEdit;
    DBedtMaestriasXCantParticipMujeres: TDBEdit;
    DBedtMaestriasXCantParticipTotal: TDBEdit;
    DBedtMaestriasXCantActivExtranjero: TDBEdit;
    DBedtMaestriasXCantActivADistancia: TDBEdit;
    DBedtMaestriasXCantActivUnivMun: TDBEdit;
    DBedtMaestriasXCantActivTotal: TDBEdit;
    DBedtEspecialidadesXCantGradProfTP: TDBEdit;
    DBedtEspecialidadesXCantGradProfTC: TDBEdit;
    DBedtEspecialidadesXCantGradExtranjeros: TDBEdit;
    DBedtEspecialidadesXCantGradMujeres: TDBEdit;
    DBedtEspecialidadesXCantGradTotal: TDBEdit;
    DBedtEspecialidadesXCantParticipADistancia: TDBEdit;
    DBedtEspecialidadesXCantParticipUnivMun: TDBEdit;
    DBedtEspecialidadesXCantParticipProfTP: TDBEdit;
    DBedtEspecialidadesXCantParticipProfTC: TDBEdit;
    DBedtEspecialidadesXCantParticipExtranjeros: TDBEdit;
    DBedtEspecialidadesXCantParticipMujeres: TDBEdit;
    DBedtEspecialidadesXCantParticipTotal: TDBEdit;
    DBedtEspecialidadesXCantActivExtranjero: TDBEdit;
    DBedtEspecialidadesXCantActivADistancia: TDBEdit;
    DBedtEspecialidadesXCantActivUnivMun: TDBEdit;
    DBedtEspecialidadesXCantActivTotal: TDBEdit;
    DBedtDoctoradosXCantGradProfTP: TDBEdit;
    DBedtDoctoradosXCantGradProfTC: TDBEdit;
    DBedtDoctoradosXCantGradExtranjeros: TDBEdit;
    DBedtDoctoradosXCantGradMujeres: TDBEdit;
    DBedtDoctoradosXCantGradTotal: TDBEdit;
    DBedtDoctoradosXCantParticipADistancia: TDBEdit;
    DBedtDoctoradosXCantParticipUnivMun: TDBEdit;
    DBedtDoctoradosXCantParticipProfTP: TDBEdit;
    DBedtDoctoradosXCantParticipProfTC: TDBEdit;
    DBedtDoctoradosXCantParticipExtranjeros: TDBEdit;
    DBedtDoctoradosXCantParticipMujeres: TDBEdit;
    DBedtDoctoradosXCantParticipTotal: TDBEdit;
    DBedtDoctoradosXCantActivExtranjero: TDBEdit;
    DBedtDoctoradosXCantActivADistancia: TDBEdit;
    DBedtDoctoradosXCantActivUnivMun: TDBEdit;
    DBedtDoctoradosXCantActivTotal: TDBEdit;
    DBedtSubTotal2XCantGradProfTP: TDBEdit;
    DBedtSubTotal2XCantGradProfTC: TDBEdit;
    DBedtSubTotal2XCantGradExtranjeros: TDBEdit;
    DBedtSubTotal2XCantGradMujeres: TDBEdit;
    DBedtSubTotal2XCantGradTotal: TDBEdit;
    DBedtSubTotal2XCantParticipADistancia: TDBEdit;
    DBedtSubTotal2XCantParticipUnivMun: TDBEdit;
    DBedtSubTotal2XCantParticipProfTP: TDBEdit;
    DBedtSubTotal2XCantParticipProfTC: TDBEdit;
    DBedtSubTotal2XCantParticipExtranjeros: TDBEdit;
    DBedtSubTotal2XCantParticipMujeres: TDBEdit;
    DBedtSubTotal2XCantParticipTotal: TDBEdit;
    DBedtSubTotal2XCantActivExtranjero: TDBEdit;
    DBedtSubTotal2XCantActivADistancia: TDBEdit;
    DBedtSubTotal2XCantActivUnivMun: TDBEdit;
    DBedtSubTotal2XCantActivTotal: TDBEdit;
    DBedtCursosXCantGradProfTP: TDBEdit;
    DBedtCursosXCantGradProfTC: TDBEdit;
    DBedtCursosXCantGradExtranjeros: TDBEdit;
    DBedtCursosXCantGradMujeres: TDBEdit;
    DBedtCursosXCantGradTotal: TDBEdit;
    DBedtCursosXCantParticipADistancia: TDBEdit;
    DBedtCursosXCantParticipUnivMun: TDBEdit;
    DBedtCursosXCantParticipProfTP: TDBEdit;
    DBedtCursosXCantParticipProfTC: TDBEdit;
    DBedtCursosXCantParticipExtranjeros: TDBEdit;
    DBedtCursosXCantParticipMujeres: TDBEdit;
    DBedtCursosXCantParticipTotal: TDBEdit;
    DBedtCursosXCantActivExtranjero: TDBEdit;
    DBedtCursosXCantActivADistancia: TDBEdit;
    DBedtCursosXCantActivUnivMun: TDBEdit;
    DBedtCursosXCantActivTotal: TDBEdit;
    DBedtEntrenamientosXCantGradProfTP: TDBEdit;
    DBedtEntrenamientosXCantGradProfTC: TDBEdit;
    DBedtEntrenamientosXCantGradExtranjeros: TDBEdit;
    DBedtEntrenamientosXCantGradMujeres: TDBEdit;
    DBedtEntrenamientosXCantGradTotal: TDBEdit;
    DBedtEntrenamientosXCantParticipADistancia: TDBEdit;
    DBedtEntrenamientosXCantParticipUnivMun: TDBEdit;
    DBedtEntrenamientosXCantParticipProfTP: TDBEdit;
    DBedtEntrenamientosXCantParticipProfTC: TDBEdit;
    DBedtEntrenamientosXCantParticipExtranjeros: TDBEdit;
    DBedtEntrenamientosXCantParticipMujeres: TDBEdit;
    DBedtEntrenamientosXCantParticipTotal: TDBEdit;
    DBedtEntrenamientosXCantActivExtranjero: TDBEdit;
    DBedtEntrenamientosXCantActivADistancia: TDBEdit;
    DBedtEntrenamientosXCantActivUnivMun: TDBEdit;
    DBedtEntrenamientosXCantActivTotal: TDBEdit;
    DBlucmbxMunicipio: TDBLookupComboBox;
    dtpAnnoPlanilla1164_01Temporal: TDateTimePicker;
    Memo5: TMemo;
    Memo2: TMemo;
    Memo1: TMemo;
    Memo3: TMemo;
    Edit7: TEdit;
    Memo4: TMemo;
    Memo32: TMemo;
    Memo33: TMemo;
    Memo34: TMemo;
    Memo35: TMemo;
    Memo36: TMemo;
    Memo37: TMemo;
    Memo38: TMemo;
    Memo39: TMemo;
    Memo40: TMemo;
    Memo41: TMemo;
    Memo42: TMemo;
    Memo43: TMemo;
    Memo44: TMemo;
    Memo45: TMemo;
    Memo46: TMemo;
    Memo47: TMemo;
    Memo48: TMemo;
    Memo49: TMemo;
    Memo50: TMemo;
    Memo51: TMemo;
    Memo52: TMemo;
    Memo53: TMemo;
    Memo54: TMemo;
    Memo55: TMemo;
    Memo56: TMemo;
    Memo57: TMemo;
    Edit82: TEdit;
    Edit131: TEdit;
    Edit132: TEdit;
    Edit133: TEdit;
    Edit134: TEdit;
    Edit135: TEdit;
    Edit136: TEdit;
    Edit137: TEdit;
    Edit138: TEdit;
    Memo6: TMemo;
    Memo7: TMemo;
    Memo8: TMemo;
    Memo9: TMemo;
    Memo10: TMemo;
    Memo11: TMemo;
    Memo12: TMemo;
    Memo13: TMemo;
    Memo14: TMemo;
    Memo15: TMemo;
    Memo16: TMemo;
    Memo17: TMemo;
    Memo18: TMemo;
    Memo19: TMemo;
    Memo20: TMemo;
    Memo21: TMemo;
    Memo22: TMemo;
    Memo23: TMemo;
    Memo24: TMemo;
    Memo25: TMemo;
    Memo26: TMemo;
    Memo27: TMemo;
    Memo28: TMemo;
    Memo29: TMemo;
    Memo30: TMemo;
    Memo31: TMemo;
    Memo58: TMemo;
    Memo59: TMemo;
    Memo60: TMemo;
    Memo61: TMemo;
    Memo62: TMemo;
    Memo63: TMemo;
    Memo64: TMemo;
    cmbxProvincia: TAdvOfficeSelector;
    DBedtNombreCentroInformante: TDBEdit;
    DBedtCodigoCentroInformante: TDBEdit;
    DBedtNombreDirectorEconomico: TDBEdit;
    DBedtNombreRectorODirector: TDBEdit;
    DBedtDoctoresXTotal: TDBEdit;
    DBedtDoctoresXCantGrad: TDBEdit;
    DBedtDoctoresXCantParticip: TDBEdit;
    DBedtDiplomadosXCantActivTotal: TDBEdit;
    DBedtDiplomadosXCantActivADistancia: TDBEdit;
    DBedtDiplomadosXCantActivUnivMun: TDBEdit;
    DBedtDiplomadosXCantActivExtranjero: TDBEdit;
    DBedtDiplomadosXCantParticipTotal: TDBEdit;
    DBedtDiplomadosXCantParticipMujeres: TDBEdit;
    DBedtDiplomadosXCantParticipExtranjeros: TDBEdit;
    DBedtDiplomadosXCantParticipProfTC: TDBEdit;
    DBedtDiplomadosXCantParticipProfTP: TDBEdit;
    DBedtDiplomadosXCantParticipUnivMun: TDBEdit;
    DBedtDiplomadosXCantParticipADistancia: TDBEdit;
    DBedtDiplomadosXCantGradTotal: TDBEdit;
    DBedtDiplomadosXCantGradMujeres: TDBEdit;
    DBedtDiplomadosXCantGradExtranjeros: TDBEdit;
    DBedtDiplomadosXCantGradProfTC: TDBEdit;
    DBedtDiplomadosXCantGradProfTP: TDBEdit;
    AdvOfficePage1: TAdvOfficePage;
    AdvOfficePage2: TAdvOfficePage;
    AdvOfficePage4: TAdvOfficePage;
    AdvOfficePage5: TAdvOfficePage;
    AdvOfficePage6: TAdvOfficePage;
    AdvOfficePage7: TAdvOfficePage;
    AdvOfficePage8: TAdvOfficePage;
    AdvOfficePage9: TAdvOfficePage;
    AdvGlassButton1: TAdvGlassButton;
    AdvGlassButton2: TAdvGlassButton;
    AdvGlassButton3: TAdvGlassButton;
    AdvGlassButton4: TAdvGlassButton;
    AdvGlassButton5: TAdvGlassButton;
    AdvGlassButton6: TAdvGlassButton;
    AdvGlassButton7: TAdvGlassButton;
    AdvGlassButton8: TAdvGlassButton;
    AdvGlassButton9: TAdvGlassButton;
    AdvGlassButton10: TAdvGlassButton;
    AdvGlassButton11: TAdvGlassButton;
    AdvGlassButton12: TAdvGlassButton;
    AdvGlassButton13: TAdvGlassButton;
    AdvGlassButton14: TAdvGlassButton;
    AdvGlassButton15: TAdvGlassButton;
    AdvGroupBox1: TAdvGroupBox;
    DBAdvGrid1: TDBAdvGrid;
    AdvGroupBox3: TAdvGroupBox;
    DBAdvGrid2: TDBAdvGrid;
    AdvGroupBox4: TAdvGroupBox;
    DBAdvGrid3: TDBAdvGrid;
    AdvGroupBox5: TAdvGroupBox;
    DBAdvGrid4: TDBAdvGrid;
    AdvGroupBox6: TAdvGroupBox;
    DBAdvGrid5: TDBAdvGrid;
    AdvGroupBox7: TAdvGroupBox;
    DBAdvGrid6: TDBAdvGrid;
    AdvGroupBox8: TAdvGroupBox;
    DBAdvGrid7: TDBAdvGrid;



    //Eventos de la forma principal (como tal)
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PersonalizarCaptionsMenuSistemaDeLaForma(AFormHandle:HWnd);
    procedure FormActivate(Sender: TObject);
    
    //Eventos del Menu Principal  (MainMenu)
    procedure SubMenuSalirClick(Sender: TObject);
    procedure SubMenuTemasDeAyudaClick(Sender: TObject);
    

    procedure ApplicationEventsSimulacionImagenesIdle(Sender: TObject; var Done: Boolean);
    procedure lblbtnNuevaCuentaDeUsuarioClick(Sender: TObject);
    procedure lblbtnModificarCuentaDeUsuarioClick(Sender: TObject);
    procedure lblbtnEliminarCuentaDeUsuarioClick(Sender: TObject);
    procedure lblbtnDetallesDeTrazaClick(Sender: TObject);
    procedure SpeedButtonDesconectarseClick(Sender: TObject);
    procedure DBGridTrazasDelSistemaDblClick(Sender: TObject);
    procedure DBGridPuestosDeTrabajoDblClick(Sender: TObject);

    //******************************
    //*** Procedimientos Comunes ***
    //******************************
    
    procedure SalvarBaseDeDatos;
    procedure RestaurarBaseDeDatos;
    procedure DesconectarElSistema;
    procedure CerrarLaAplicacion;
    procedure MostrarAyudaGeneralDelSistema;

    //Configuracion del idioma
    procedure SetIdiomaEspannol;
    procedure SetIdiomaIngles;

    function MinDeTres(a, b, c: integer): integer;
    function MaxDeTres(a, b, c: integer): integer;
    function ObtenerFechaDelSistema: String;



    

    //*************************************
    //*** Modulo de Control del Sistema ***
    //*************************************

    //Pesta�a de Cuentas de Usuarios
    Procedure AgregarCuentaDeUsuario;
    Procedure ModificarCuentaDeUsuario;
    Procedure EliminarCuentaDeUsuario;

    procedure ActualizarCuentasDeUsuario;

    procedure PrevisualizarReporteCuentasDeUsuario;
    procedure ExportarHaciaPDFReporteCuentasDeUsuario;
    procedure ImprimirReporteCuentasDeUsuario;


    //Pesta�a de Trazas del Sistema
    procedure DetallarTrazaDelSistema;

    procedure PrevisualizarReporteTrazasDelSistema;
    procedure ExportarHaciaPDFReporteTrazasDelSistema;
    procedure ImprimirReporteTrazasDelSistema;



    //***************************
    //*** Modulo de Informes ***
    //***************************

    //Pesta�a de Informe MES 1164-1
    Procedure AgregarInformeMES1164;
    Procedure ModificarInformeMES1164;
    Procedure EliminarInformeMES1164;

    procedure MostrarBalanceAnualDePlanillas1164_01;
    procedure ImportarPlanilla1164_01DesdeFichero;
    procedure ExportarPlanilla1164_01HaciaFichero;

    procedure RellenarPlanillaTemporal(aPlanilla: TPlanilla1164_01);
    procedure ReposicionarComponentesNoDirectos;

    //Trabajo con ficheros *.P01
    procedure ExtraerFicheroP01(aPath: AnsiString);

        
    procedure ActualizarInformesMES1164;

    procedure PrevisualizarReporteInformeMES1164;
    procedure ExportarHaciaPDFReporteInformeMES1164;
    procedure ImprimirReporteInformeMES1164;

    procedure ActualizarFiltroPorAnno;






    procedure lblbtnExportarHaciaPDFReporteTrazasDelSistemaClick(Sender: TObject);
    procedure lblbtnPrevisualizarReporteTrazasDelSistemaClick(Sender: TObject);

    procedure lblbtnExportarHaciaPDFReporteCuentasDeUsuarioClick(Sender: TObject);
    procedure lblbtnPrevisualizarReporteCuentasDeUsuarioClick(Sender: TObject);

    procedure barbtnAcercaDeClick(Sender: TObject);
    procedure SubMenuAcercaDeClick(Sender: TObject);
    
    procedure barbtnTemasDeAyudaClick(Sender: TObject);
    procedure barbtnSalvarBaseDeDatosClick(Sender: TObject);
    procedure SubMenuSalvarBaseDeDatosClick(Sender: TObject);
    procedure barbtnDesconectarClick(Sender: TObject);
    procedure SubMenuDesconectarClick(Sender: TObject);
    procedure SubMenuVerReporteCuentasDeUsuarioClick(Sender: TObject);
    procedure SubMenuVerReporteTrazasDelSistemaClick(Sender: TObject);
    procedure SubMenuVerDetallesDeTrazaClick(Sender: TObject);
    procedure SubMenuAgregarCuentaDeUsuarioClick(Sender: TObject);
    procedure SubMenuModificarCuentaDeUsuarioClick(Sender: TObject);
    procedure SubMenuEliminarCuentaDeUsuarioClick(Sender: TObject);
    procedure SubMenuExportarReporteCuentasDeUsuarioClick(Sender: TObject);
    procedure SubMenuExportarReporteTrazasDelSistemaClick(Sender: TObject);
    procedure SubMenuImprimirReporteCuentasDeUsuarioClick(Sender: TObject);
    procedure SubMenuImprimirReporteTrazasDelSistemaClick(Sender: TObject);
    procedure SubMenuRestaurarBaseDeDatosClick(Sender: TObject);
    procedure barbtnRestaurarBaseDeDatosClick(Sender: TObject);


    //Validaciones de pulsado de teclas
    procedure SoloLetrasConEspaciosYPuntuacionKeyPress(Sender: TObject; var Key: Char); //Para nombres, apellidos, etc.
    procedure SoloLetrasYNumerosSinPuntuacionNiEspaciosKeyPress(Sender: TObject; var Key: Char);
    procedure btnNuevaPlanilla1164_01Click(Sender: TObject);
    procedure ckbxFiltrarPlanillas1164_01PorAnnoClick(Sender: TObject);
    procedure btnEliminarPlanilla1164_01Click(Sender: TObject);
    procedure cmbxFiltrarPlanillas1164_01PorProvinciaChange(Sender: TObject);
    procedure dtpAnnoChange(Sender: TObject);
    procedure btnModificarPlanilla1164_01Click(Sender: TObject);
    procedure DBGridPlanillas1164_01DblClick(Sender: TObject);
    procedure btnImportarPlanillaDesdeFicheroClick(Sender: TObject);
    procedure btnExportarPlanillaHaciaFicheroClick(Sender: TObject);
    procedure btnBalanceAnualPlanillas1164_01Click(Sender: TObject);
    procedure SubMenuAgregarPlanilla1164_01Click(Sender: TObject);
    procedure SubMenuModificarPlanilla1164_01Click(Sender: TObject);
    procedure SubMenuEliminarPlanilla1164_01Click(Sender: TObject);
    procedure SubMenuVerBalanceAnualDePlanillas1164_01Click(
      Sender: TObject);
    procedure SubMenuImportarPlanilla1164_01DesdeFicheroClick(
      Sender: TObject);
    procedure SubMenuExportarPlanilla1164_01HaciaFicheroClick(
      Sender: TObject);
    procedure btnPrevisualizarReportePlanillas1164_01Click(
      Sender: TObject);
    procedure SubMenuVerReportePlanillas1164_01Click(Sender: TObject);
    procedure btnExportarHaciaPDFReportePlanillas1164_01Click(
      Sender: TObject);
    procedure SubMenuExportarReportePlanillas1164_01Click(Sender: TObject);
    procedure SubMenuImprimirReportePlanillas1164_01Click(Sender: TObject);
    procedure cmbxProvinciaChange(Sender: TObject); //IDs cubanos (n�meros) y extranjeros (letras y n�meros)
    
  private
    { Private declarations }
    FUpdatingSelfOptionsSimulacionImagenes: Boolean;

    //Cosas para el Menu Especial
    FDrawBuffer: TBitmap;

    //Variables para el uso de imagenes vectoriales
    _OriginalBitmap: TBitmap;
    _nmesas: Integer;

    //Variables para borrado de ficheros sim
    ProcedenciaDelFicheroSimulacionImagenes: AnsiString;
    
    function GetDrawBuffer: TBitmap;

    procedure appmessage(var msg: tmsg; var handled: boolean);
    procedure DeterminarResolucionInicial;
    function CambiarResolucion(XRes, YRes: DWord): integer;

    function QuitaEn(Cadena, Esto: String): String;
    function CumpleConFormatoAdecuado(aCadena: String): Boolean;
    function ExtraerParteUtilDeNombreFichero(aCadena: String): String;


    function QuitarEspaciosVaciosAlInicio(aNombre: AnsiString): AnsiString;

  public
    procedure DrawGradient(Canvas: TCanvas; ARect: TRect; StartingColor, EndingColor: TColor; Style: TGradientStyle);

    property DrawBuffer: TBitmap read GetDrawBuffer;
    { Public declarations }

  end;



var
  frmPrincipal: TfrmPrincipal;


const
    MaxPixelCount   =  32768;

type
    pRGBArray  =  ^TRGBArray;
    TRGBArray  =  ARRAY[0..MaxPixelCount-1] OF TRGBTriple;

  function Min(a, b: integer): integer;
  function Max(a, b: integer): integer;




      implementation
  
 uses UfrmPresentacion,
 BcRectUtilities, DateUtils;

var
    //Variables para la configuracion del modo de pantalla (optimo = 1024 X 768)
    AnchoOriginalPantalla: Integer;
    AltoOriginalPantalla: Integer;
    Pantalla: TPantalla;

    BookLogger: TGestionDocente;
    //TrabajadorLoggeado: TTrabajadorLoggeado;
    ModuloActivo: string;
    PestannaActiva: string;
    Ocioso: Boolean;
    VecesEntrando: Integer;

    
    //*** Variables de trabajo con archivos ***
    FicheroPlanilla1164_01: TFicheroPlanilla1164_01;

    //Variables para nombres de archivos abiertos
    ArchivoEnteroAbiertoPlanilla1164_01: AnsiString;
    CaminoDelArchivoAbiertoPlanilla1164_01: AnsiString;

    NombreEnteroDelArchivoAbiertoPlanilla1164_01: AnsiString;
    NombreDelArchivoAbiertoPlanilla1164_01: AnsiString;
    NombreUtilDelArchivoAbiertoPlanilla1164_01: AnsiString;

    ExtensionDelArchivoAbiertoPlanilla1164_01: AnsiString;



    
    //Variables del sistema de configuracion de idioma
    IdiomaImperante: AnsiString;
    FicheroIdioma: TFicheroIdioma;

    //Variables para la busqueda en los archivos
    TipoBusqueda: AnsiString;

    CarneIdentidad,
    Nombre,
    Apellidos: AnsiString;

{$R *.dfm}



Procedure TfrmPrincipal.appmessage(var msg:tmsg; var handled:boolean);
begin
  if (   (msg.message = wm_syscommand) and (msg.wParam = sc_screensave)   )
    then handled:= True;
end;



procedure TfrmPrincipal.SubMenuSalirClick(Sender: TObject);
begin
  //Cierro la aplicaci�n
  CerrarLaAplicacion;
end;


{---------------------------------------------------------}


procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  //Deshabilito los componentes

  //Creo el fichero de idioma
  FicheroIdioma:= TFicheroIdioma.New;

  //Cargo el fichero de idioma
  FicheroIdioma.Cargar(ExtractFilePath(Application.ExeName) + 'Languaje\lang.txt');

  //Determino el idoma a mostrar en a interfaz
  if (FicheroIdioma.DeterminarIdiomaImperante = 'Ingles')
    then
      begin
        //Actualizo la variable indicadora de idioma imperante
        IdiomaImperante:= 'Ingles';

        //Instauro el idioma ingles
        SetIdiomaIngles;
      end
        else
          begin
            if (FicheroIdioma.DeterminarIdiomaImperante = 'Espannol')
              then
                begin
                  //Actualizo la variable indicadora de idioma imperante
                  IdiomaImperante:= 'Espannol';

                  //Instauro el idioma espannol
                  SetIdiomaEspannol;
                end;
          end;

  if (VecesEntrando = 1)
    then
      begin
        //Muestro el Splash Screen
        frmPresentacion.ShowModal;

        //Muestro la forma de validacion
        frmValidacionPuestoDeTrabajo.Position:= poDesktopCenter;
        frmValidacionPuestoDeTrabajo.ShowModal;
      end;

  //Verificacion de acceso
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Verifico de nuevo la conexi�n, por si se cancel� el Loggeo
        if (BookLogger.ExisteConexionConLaBD = True)
          then
            begin
              //Decido qu� componentes mostrar en dependencia de los privilegios del Loggeado
              if ( BookLogger.ElTrabajadorEsAdministrador = False)
                then
                  begin //Se trata de un Operador
                    //Oculto la pesta�a de Control del Sistema
                    AdvTabSheetControlDelSistema.TabVisible:= False;
                  end
                    else
                      begin //Se trata de un Administrador
                        //Muestro la pesta�a de Control del Sistema
                        AdvTabSheetControlDelSistema.TabVisible:= True;
                      end;

              //Inserto la Traza
              BookLogger.GuardarTrazaDelSistema('Entr� al sistema BookLogger v1.0.');

              //Actualizo las trazas
              BookLogger.MostrarTodasLasTrazas;

              //Muestro las Cuentas de Usuario en el DBGrid del M�dulo de Cuentas de Usuario
              BookLogger.MostrarPuestosDeTrabajo;

              //Muestro los datos referentes al DBGrid del M�dulo de Cuentas de Usuario
              ActualizarCuentasDeUsuario;

              //Actualizo el filtro por a�o
              ActualizarFiltroPorAnno;

              //Actualizo las Planillas 1164-01
              ActualizarInformesMES1164;
            end;
      end;
end;



procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  {Shut down WinSock}
  WSACleanup;

  //Restituyo la resoluci�n de la pantalla
  CambiarResolucion(AnchoOriginalPantalla, AltoOriginalPantalla);  
end;



procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (BookLogger.ExisteConexionConLaBD)
    then
      begin
        //Inserto la Traza
        BookLogger.GuardarTrazaDelSistema('Sali� del sistema BookLogger v1.0');

        //Actualizo todas las trazas
        BookLogger.MostrarTodasLasTrazas;

        //Desloggeo al usuario
        BookLogger.DesloggearAlUsuario;
      end;
      
  //Restituyo la resoluci�n de la pantalla
  CambiarResolucion(AnchoOriginalPantalla, AltoOriginalPantalla);
end;



procedure TfrmPrincipal.DeterminarResolucionInicial;
begin
  //Determino la resoluci�n inicial de la pantalla
  AnchoOriginalPantalla:= GetSysTemMetrics(SM_CXSCREEN);   {Ancho}
  AltoOriginalPantalla:= GetSysTemMetrics(SM_CYSCREEN);   {Alto}
end;



function TfrmPrincipal.CambiarResolucion(XRes, YRes: DWord):integer;
var
  lpDevMode : TDeviceMode;
begin
//Cambio la resoluci�n de la pantalla a los valores
  EnumDisplaySettings(nil, 0, lpDevMode);
  lpDevMode.dmFields:=DM_PELSWIDTH or DM_PELSHEIGHT;
  lpDevMode.dmPelsWidth:=XRes;
  lpDevMode.dmPelsHeight:=YRes;
  CambiarResolucion:=ChangeDisplaySettings(lpDevMode, 0);
end;



procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  wVersionRequested : WORD;
  wsaData : TWSAData;
begin
  //Para poder obtener el IP y nombre de la PC
  {Start up WinSock}
  wVersionRequested := MAKEWORD(1, 1);
  WSAStartup(wVersionRequested, wsaData);

  //Llamo al procedimiento que impide que se levante el salvapantallas, cuando trate de mostrarse.
  Application.OnMessage:=appmessage;
  VecesEntrando:= 1;
    
  //Pruebas
  //ATImageBoxSimulacionImagenes.Image.OnMouseDown:= ATImageBoxImageSimulacionImagenesMouseDown;
  //ATImageBoxSimulacionImagenes.Image.OnMouseMove:= ATImageBoxImageSimulacionImagenesMouseMove;

  //PersonalizarCaptionsMenuSistemaDeLaForma(Handle);

  //Llamo al procedimiento que impide que se levante el salvapantallas, cuando trate de mostrarse.
  Application.OnMessage:=appmessage;

  //Determino la resoluci�n inicial de la pantalla
  DeterminarResolucionInicial;

  //Creo una instancia de la clase pantalla
  Pantalla:= TPantalla.Create;

  //Guardo los valores inicales de la pantalla
  Pantalla.AnchoOriginalPantalla:= AnchoOriginalPantalla;
  Pantalla.AltoOriginalPantalla:= AltoOriginalPantalla;

  if (   (AnchoOriginalPantalla < 1024) or (AltoOriginalPantalla < 768)   )
    then
      begin
        //Cambio la resoluci�n de la pantalla hacia 1024 X 768
        CambiarResolucion(1024, 768);
      end;   


  //--------------------------------------------------
  //*** Estipulo la configuracion para los dialogs ***
  //--------------------------------------------------
  //Customizo los botones y paneles para los dialogs
  MsgOptions.CustomButtonsColorScheme := btncsNeoSilver;
  MsgOptions.CustomPanelColorScheme := pnlcsSilver;
  //MsgOptions.CustomProgressColorScheme := procsSky;   //no es necesario en los dialogs
  
  //Usar customizacion para paneles de los dialogs
  MsgOptions.UseCustomPanel := True;

  //Usar customizacion para botones de los dialogs
  MsgOptions.UseCustomButtons := True;

  //Usar customizacion para el font de los dialogs
  MsgOptions.UseCustomFont := True;

  //Le especifico un font adecuado para los dialogs
  MsgOptions.Font.Assign(FontDialog.Font);

  //Usar gradiente en los dialogs
  MsgOptions.UseGradient := True;

  //Usar forma especial en los botones de los dialogs
  MsgOptions.UseShapedForm := True;

  //No mostrar bordes en los dialogs
  MsgOptions.UseBorder := False;

  //MsgOptions.FormRoundSize := 15;
  //MsgOptions.StartGradientColor := clNavy;
  //MsgOptions.EndGradientColor := clBlack;

  //Color de
    //MsgOptions.StartGradientColor := 15448477; //clGradientInactiveCaption;
    //MsgOptions.EndGradientColor := 16749885; //clGradientActiveCaption;

  //MsgOptions.Font.Name := 'Tahoma';
  //MsgOptions.Font.Style := [fsBold];
end;



procedure TfrmPrincipal.SubMenuTemasDeAyudaClick(Sender: TObject);
begin
  //Muestro la ayuda general del sistema BookLogger
  MostrarAyudaGeneralDelSistema;
end;



//*** Configuracion del idioma ***

procedure TfrmPrincipal.SetIdiomaEspannol; //Cambio los caption de todo el sistema, hacia el idioma espa�ol
begin
  MsgOptions.DefLang:= ltSpanish;
end;



procedure TfrmPrincipal.SetIdiomaIngles;
begin
  MsgOptions.DefLang:= ltEnglish;
end;




procedure TfrmPrincipal.FormResize(Sender: TObject);
begin
//**** Plantilla para determinar Modulo y Seccion en activo ****
{
  if (PageControlTodo.ActivePageIndex = 0) //Modulo de Simulacion
    then
      begin

      end
        else
          begin
            if (PageControlTodo.ActivePageIndex = 1) //Modulo de Entrenamiento
             then
               begin
                 if (PageControlEntrenamiento.ActivePageIndex = 0) //Seccion de Microscopio Optico
                   then
                     begin

                     end
                       else
                         begin
                           if (PageControlEntrenamiento.ActivePageIndex = 1) //Seccion de Casos Tipicos
                             then
                               begin

                               end;
                         end;
               end;
          end;
}
end;



procedure TfrmPrincipal.ApplicationEventsSimulacionImagenesIdle(Sender: TObject; var Done: Boolean);
begin
  //Determino los Items del Menu Principal que se ver�n
  //En dependencia de la pesta�a activa
  if (AdvPageControlPrincipal.ActivePageIndex = 0)
    then
      begin // *** Modulo de Control del Sistema ***
        if (AdvOfficePagerControlDelSistema.ActivePageIndex = 0)
          then
            begin // * Pesta�a de Usuarios del Sistema *
              //Menu Archivos
              SubMenuDesconectar.Visible:= True;

              SubMenuExportarReporteCuentasDeUsuario.Visible:= True;
              SubMenuExportarReporteTrazasDelSistema.Visible:= False;
              SubMenuExportarReportePlanillas1164_01.Visible:= False;

              SubMenuImprimirReporteCuentasDeUsuario.Visible:= True;
              SubMenuImprimirReporteTrazasDelSistema.Visible:= False;
              SubMenuImprimirReportePlanillas1164_01.Visible:= False;

              SubMenuSalir.Visible:= True;



              //Menu Edici�n
              SubMenuAgregarCuentaDeUsuario.Visible:= True;
              SubMenuModificarCuentaDeUsuario.Visible:= True;
              SubMenuEliminarCuentaDeUsuario.Visible:= True;

              SubMenuAgregarPlanilla1164_01.Visible:= False;
              SubMenuModificarPlanilla1164_01.Visible:= False;
              SubMenuEliminarPlanilla1164_01.Visible:= False;

              SubMenuEdicionSeparacion01.Visible:= False;
              SubMenuExportarPlanilla1164_01HaciaFichero.Visible:= False;
              SubMenuImportarPlanilla1164_01DesdeFichero.Visible:= False;



              //Menu Ver
              SubMenuVerReporteCuentasDeUsuario.Visible:= True;

              SubMenuVerReporteTrazasDelSistema.Visible:= False;
              SubMenuVerDetallesDeTraza.Visible:= False;
              
              SubMenuVerReportePlanillas1164_01.Visible:= False;
              SubMenuVerBalanceAnualDePlanillas1164_01.Visible:= False;



              //Menu Herramientas
              SubMenuSalvarBaseDeDatos.Visible:= True;
              SubMenuRestaurarBaseDeDatos.Visible:= True;

              

              //Menu Ayuda
              SubMenuTemasDeAyuda.Visible:= True;
              SubMenuAcercaDe.Visible:= True;
            end
              else
                begin
                  if (AdvOfficePagerControlDelSistema.ActivePageIndex = 1)
                    then
                      begin // * Pesta�a de Trazas del Sistema *
                        //Menu Archivos
                        SubMenuDesconectar.Visible:= True;

                        SubMenuExportarReporteCuentasDeUsuario.Visible:= False;
                        SubMenuExportarReporteTrazasDelSistema.Visible:= True;
                        SubMenuExportarReportePlanillas1164_01.Visible:= False;

                        SubMenuImprimirReporteCuentasDeUsuario.Visible:= False;
                        SubMenuImprimirReporteTrazasDelSistema.Visible:= True;
                        SubMenuImprimirReportePlanillas1164_01.Visible:= False;

                        SubMenuSalir.Visible:= True;



                        //Menu Edici�n
                        SubMenuAgregarCuentaDeUsuario.Visible:= False;
                        SubMenuModificarCuentaDeUsuario.Visible:= False;
                        SubMenuEliminarCuentaDeUsuario.Visible:= False;

                        SubMenuAgregarPlanilla1164_01.Visible:= False;
                        SubMenuModificarPlanilla1164_01.Visible:= False;
                        SubMenuEliminarPlanilla1164_01.Visible:= False;

                        SubMenuEdicionSeparacion01.Visible:= False;
                        SubMenuExportarPlanilla1164_01HaciaFichero.Visible:= False;
                        SubMenuImportarPlanilla1164_01DesdeFichero.Visible:= False;



                        //Menu Ver
                        SubMenuVerReporteCuentasDeUsuario.Visible:= False;

                        SubMenuVerReporteTrazasDelSistema.Visible:= True;
                        SubMenuVerDetallesDeTraza.Visible:= True;
              
                        SubMenuVerReportePlanillas1164_01.Visible:= False;
                        SubMenuVerBalanceAnualDePlanillas1164_01.Visible:= False;



                        //Menu Herramientas
                        SubMenuSalvarBaseDeDatos.Visible:= True;
                        SubMenuRestaurarBaseDeDatos.Visible:= True;

              

                        //Menu Ayuda
                        SubMenuTemasDeAyuda.Visible:= True;
                        SubMenuAcercaDe.Visible:= True;
                      end;
                end;
      end
        else
          begin
            if (AdvPageControlPrincipal.ActivePageIndex = 1)
              then
                begin // *** M�dulo de Informes ***
                  if (OfficePagerInformesMES.ActivePageIndex = 0)
                    then
                      begin // * Pesta�a de Informes 1164-1 (MES) *
                        //Menu Archivos
                        SubMenuDesconectar.Visible:= True;

                        SubMenuExportarReporteCuentasDeUsuario.Visible:= False;
                        SubMenuExportarReporteTrazasDelSistema.Visible:= False;
                        SubMenuExportarReportePlanillas1164_01.Visible:= True;

                        SubMenuImprimirReporteCuentasDeUsuario.Visible:= False;
                        SubMenuImprimirReporteTrazasDelSistema.Visible:= False;
                        SubMenuImprimirReportePlanillas1164_01.Visible:= True;

                        SubMenuSalir.Visible:= True;



                        //Menu Edici�n
                        SubMenuAgregarCuentaDeUsuario.Visible:= False;
                        SubMenuModificarCuentaDeUsuario.Visible:= False;
                        SubMenuEliminarCuentaDeUsuario.Visible:= False;

                        SubMenuAgregarPlanilla1164_01.Visible:= True;
                        SubMenuModificarPlanilla1164_01.Visible:= True;
                        SubMenuEliminarPlanilla1164_01.Visible:= True;

                        SubMenuEdicionSeparacion01.Visible:= True;
                        SubMenuExportarPlanilla1164_01HaciaFichero.Visible:= True;
                        SubMenuImportarPlanilla1164_01DesdeFichero.Visible:= True;



                        //Menu Ver
                        SubMenuVerReporteCuentasDeUsuario.Visible:= False;

                        SubMenuVerReporteTrazasDelSistema.Visible:= False;
                        SubMenuVerDetallesDeTraza.Visible:= False;
              
                        SubMenuVerReportePlanillas1164_01.Visible:= True;
                        SubMenuVerBalanceAnualDePlanillas1164_01.Visible:= True;



                        //Menu Herramientas
                        SubMenuSalvarBaseDeDatos.Visible:= True;
                        SubMenuRestaurarBaseDeDatos.Visible:= True;

              

                        //Menu Ayuda
                        SubMenuTemasDeAyuda.Visible:= True;
                        SubMenuAcercaDe.Visible:= True;                       
                      end;
                end;
          end;
end;



function TfrmPrincipal.QuitaEn(Cadena, Esto: String): String;
var
  aPos: Integer;
begin
  aPos:= Pos(Esto, Cadena);
  Result:= '';
  
  while (aPos > 0) do
    begin
      Result := Result + Copy(Cadena, 1, aPos-1);
      Delete(Cadena, 1, aPos + Length(Esto)-1);
      aPos := Pos(Esto, Cadena);
    end;

  Result:= Result + Cadena;
end;



function Min(a, b: integer): integer;
begin
  if a < b then result := a
  else result := b;
end;



function Max(a, b: integer): integer;
begin
  if a > b then result := a
  else result := b;
end;



procedure TfrmPrincipal.PersonalizarCaptionsMenuSistemaDeLaForma(AFormHandle:HWnd);
const 
  STR_CLOSE    = '&Cerrar';
  STR_MAXIMIZE = 'Ma&ximizar';
  STR_MINIMIZE = 'Mi&nimizar';
  STR_SIZE     = 'Redimen&sionar';
  STR_MOVE     = '&Mover';
  STR_RESTORE  = '&Restaurar';
var 
  SystemMenu     : HMenu;
  MyMenuItemInfo : TMenuItemInfo;
begin 
  SystemMenu := GetSystemMenu(AFormHandle, FALSE);
  FillChar(MyMenuItemInfo,SizeOf(TMenuItemInfo),#0);
  MyMenuItemInfo.cbSize := SizeOf(TMenuItemInfo);
  MyMenuItemInfo.fMask  := MIIM_TYPE or MIIM_ID or MIIM_STATE;
  MyMenuItemInfo.fType  := MFT_STRING;

  MyMenuItemInfo.wId        := SC_CLOSE;
  MyMenuItemInfo.dwTypeData := STR_CLOSE;
  MyMenuItemInfo.cch        := Length(STR_CLOSE);
  SetMenuItemInfo(SystemMenu,
                  SC_CLOSE,
                  FALSE,
                  MyMenuItemInfo);
 
  MyMenuItemInfo.wId        := SC_MAXIMIZE;
  MyMenuItemInfo.dwTypeData := STR_MAXIMIZE;
  MyMenuItemInfo.cch        := Length(STR_MAXIMIZE);
  SetMenuItemInfo(SystemMenu,
                  SC_MAXIMIZE,
                  FALSE,
                  MyMenuItemInfo);
 
  MyMenuItemInfo.wId        := SC_MINIMIZE;
  MyMenuItemInfo.dwTypeData := STR_MINIMIZE;
  MyMenuItemInfo.cch        := Length(STR_MINIMIZE);
  SetMenuItemInfo(SystemMenu,
                  SC_MINIMIZE,
                  FALSE,
                  MyMenuItemInfo);
 
  MyMenuItemInfo.wId        := SC_SIZE;
  MyMenuItemInfo.dwTypeData := STR_SIZE;
  MyMenuItemInfo.cch        := Length(STR_SIZE);
  SetMenuItemInfo(SystemMenu,
                  SC_SIZE,
                  FALSE,
                  MyMenuItemInfo);
 
  MyMenuItemInfo.wId        := SC_MOVE;
  MyMenuItemInfo.dwTypeData := STR_MOVE;
  MyMenuItemInfo.cch        := Length(STR_MOVE);
  SetMenuItemInfo(SystemMenu,
                  SC_MOVE,
                  FALSE,
                  MyMenuItemInfo);
 
  MyMenuItemInfo.wId        := SC_RESTORE;
  MyMenuItemInfo.dwTypeData := STR_RESTORE;
  MyMenuItemInfo.cch        := Length(STR_RESTORE);
  SetMenuItemInfo(SystemMenu,
                  SC_RESTORE,
                  FALSE,
                  MyMenuItemInfo);

end;




function TfrmPrincipal.CumpleConFormatoAdecuado(aCadena: String): Boolean;
var
  LargoTotal: Integer;
  Inicio: Integer;
  Aumento: String;
begin
  //Inicializo la respuesta en verdadero
  Result:= True;

  //Primero determinamos el largo total de la cadena original
  LargoTotal:= length(aCadena);

  //Luego determinamos el indice a partir del cual empieza la subcadena: _X_
  Inicio:=  PosEx('_X_', aCadena, 1 );

  //Si hubo error al hayar la cadena _X_ entonces es falso
  if (Inicio = 0)
    then
      begin
        Result:= False;
      end;

  //Ahora tomo en consideraci�n el formato en que se encuentra el archivo
  //*** Verificamos si la imagen cargada es de extension *.sim, *.bmp o *.jpg
  if (  LowerCase( AnsiRightStr(aCadena, 3) ) = 'jpg'   )
    then
      begin //Formato *.JPG
        //Luego determino el aumento
        Aumento:= AnsiMidStr(aCadena, Inicio + 3, (LargoTotal - Inicio - 3 - 3)   );
      end   //Fin de formato *.JPG
        else
          begin
            if (  LowerCase( AnsiRightStr(aCadena, 3) ) = 'bmp'   )
              then
                begin //Formato *.BMP
                  //Luego determino el aumento
                  Aumento:= AnsiMidStr(aCadena, Inicio + 3, (LargoTotal - Inicio - 3 - 3)   );
                end   //Fin de formato *.BMP
                  else
                    begin
                      if (  LowerCase( AnsiRightStr(aCadena, 4) ) = 'jpeg'   )
                        then
                          begin //Formato *.JPEG
                            //Luego determino el aumento
                            Aumento:= AnsiMidStr(aCadena, Inicio + 3, (LargoTotal - Inicio - 3 - 4)   );
                          end;  //Fin de formato *.JPEG
                    end;
          end;      

  //Si hubo error al hayar el aumento entonces es falso
  if (Aumento = '')
    then
      begin
        Result:= False;
      end;
end;



function TfrmPrincipal.ExtraerParteUtilDeNombreFichero(aCadena: String): String;
var
  //LargoTotal: Integer;
  Inicio: Integer;
begin
  //Primero determinamos el largo total de la cadena original
  //LargoTotal:= length(aCadena);

  //Luego determinamos el indice a partir del cual empieza la subcadena: _X_
  Inicio:=  PosEx('_X_', aCadena, 1 );

  //Luego determino la parte util del nombre
  Result:= AnsiMidStr(aCadena, 1, (Inicio - 1));
end;



function TfrmPrincipal.MaxDeTres(a, b, c: integer): integer;
begin
  if (   (a >= b) and (a >= c)   )
    then
      begin
        Result := a
      end
        else
          begin
            if (   (b >= a) and (b >= c)   )
              then
                begin
                  Result := b
                end
                  else
                    begin
                      if (   (c >= a) and (c >= b)   )
                        then
                          begin
                            Result := c
                          end;
                    end;
          end;
end;



function TfrmPrincipal.MinDeTres(a, b, c: integer): integer;
begin
  if (   (a <= b) and (a <= c)   )
    then
      begin
        Result := a
      end
        else
          begin
            if (   (b <= a) and (b <= c)   )
              then
                begin
                  Result := b
                end
                  else
                    begin
                      if (   (c <= a) and (c <= b)   )
                        then
                          begin
                            Result := c
                          end
                            else;
                    end;
          end;
end;










procedure TfrmPrincipal.DrawGradient(Canvas: TCanvas; ARect: TRect;
  StartingColor, EndingColor: TColor; Style: TGradientStyle);
begin
  DrawBuffer.Height := RectHeight(ARect);
  DrawBuffer.Width := RectWidth(ARect);
  BarMenus.DrawGradient(DrawBuffer, nil, BitmapRect(DrawBuffer), startingColor, EndingColor, Style);
  Canvas.Draw(ARect.Left, ARect.Top, DrawBuffer); // copy the buffer
  DrawBuffer.Height := 0;
  DrawBuffer.Width := 0;
end;



function TfrmPrincipal.GetDrawBuffer: TBitmap;
begin
  if not Assigned(FDrawBuffer) then
    FDrawBuffer := TBitmap.Create;
  Result := FDrawBuffer;
end;



function TfrmPrincipal.QuitarEspaciosVaciosAlInicio(aNombre: AnsiString): AnsiString;
var
 i: Integer;
 Ancho: Integer;
 
 NombreInicial, NombreEditado: AnsiString;
label Inicio, Salida;
begin
  //Recibo el nombre a editar
  NombreInicial:= aNombre;

  //Inicialmente el nombre editado es el mismo que el pasado por datos
  NombreEditado:= aNombre;
  
  //Etiqueta de inicio de la funcion
  Inicio:

  //Recorro desde el 1er caracter de la cadena, hasta el ultimo
  for i:= 1 to Length(NombreInicial) do
    begin //Inicio del ciclo
      //Si encuentro uno vacio entonces
      if (NombreInicial[i] = ' ')
        then
          begin
            //Tomo el ancho de la cadena a extraer
            Ancho:= Length(NombreInicial) - 1;
            
            //Elimino ese caracter nulo a la izquierda
            NombreEditado:= AnsiRightStr(NombreInicial, Ancho);
            NombreInicial:= NombreEditado;
            //Vuelvo a empezar el ciclo, desde el primcipio del mismo
            goto Inicio;
          end
            else
              begin
                //Salgo del ciclo
                break;
              end;

    end;  //Fin del ciclo

  //Etiqueta de salida de la funcion
  Salida:

  //Sale el nombre ya editado
  Result:= NombreEditado;
end;



procedure TfrmPrincipal.FormActivate(Sender: TObject);
Label Salida;
begin
  //Verifico si se hizo una llamada
  if (ParamCount <> 0)
    then
      begin
        //
      end;

  //Etiqueta que marca un punto de salida del procedimiento
  Salida:

end;



function TfrmPrincipal.ObtenerFechaDelSistema: String;
var 
   stSystemTime : TSystemTime;
begin 
   Windows.GetLocalTime( stSystemTime );
   Result := AnsiLeftStr(   DateTimeToStr( SystemTimeToDateTime( stSystemTime ) ), 10   );
end;



procedure TfrmPrincipal.lblbtnNuevaCuentaDeUsuarioClick(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Agrego una nueva Cuenta de Usuario
        AgregarCuentaDeUsuario;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.lblbtnModificarCuentaDeUsuarioClick(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Modifico la Cuenta de Usuario seleccionada
        ModificarCuentaDeUsuario;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.lblbtnEliminarCuentaDeUsuarioClick(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Elimino la Cuenta de Usuario seleccionada
        EliminarCuentaDeUsuario;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.lblbtnDetallesDeTrazaClick(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Detallo la Traza del Sistema
        DetallarTrazaDelSistema;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SpeedButtonDesconectarseClick(Sender: TObject);
begin
  //
end;



procedure TfrmPrincipal.DBGridTrazasDelSistemaDblClick(Sender: TObject);
begin
  //Primero verifico que exista aun conexion a la base de datos
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        if (lblbtnDetallesDeTraza.Enabled = True)
          then
            begin
              lblbtnDetallesDeTraza.Click;
            end;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.DBGridPuestosDeTrabajoDblClick(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Modifico la Cuenta de Usuario seleccionada
        ModificarCuentaDeUsuario;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.lblbtnExportarHaciaPDFReporteTrazasDelSistemaClick(
  Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Exporto hacia PDF el Reporte de Trazas del Sistema
        ExportarHaciaPDFReporteTrazasDelSistema;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.lblbtnPrevisualizarReporteTrazasDelSistemaClick(
  Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Previsualizo el Reporte de Trazas del Sistema
        PrevisualizarReporteTrazasDelSistema;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.lblbtnExportarHaciaPDFReporteCuentasDeUsuarioClick(
  Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Exporto hacia PDF el Reporte de Cuentas de Usuarios
        ExportarHaciaPDFReporteCuentasDeUsuario;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.lblbtnPrevisualizarReporteCuentasDeUsuarioClick(
  Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Previsualizo el Reporte de Cuentas de Usuarios
        PrevisualizarReporteCuentasDeUsuario;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.barbtnAcercaDeClick(Sender: TObject);
begin
  frmAcercaDe.Position:= poDesktopCenter;
  PlaySound(pChar('SYSTEMEXCLAMATION'), 0, SND_ASYNC);
  frmAcercaDe.ShowModal;
end;



procedure TfrmPrincipal.SubMenuAcercaDeClick(Sender: TObject);
begin
  //Ejecuto el BarButton de 'Acerca de BookLogger'
  barbtnAcercaDe.Click;
end;



procedure TfrmPrincipal.barbtnTemasDeAyudaClick(Sender: TObject);
begin
  //Muestro la ayuda general del sistema BookLogger
  MostrarAyudaGeneralDelSistema;
end;



procedure TfrmPrincipal.barbtnSalvarBaseDeDatosClick(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Ejecuto el procedimiento de Salvar Base de Datos
        SalvarBaseDeDatos;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuSalvarBaseDeDatosClick(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Ejecuto el procedimiento de Salvar Base de Datos
        SalvarBaseDeDatos;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.barbtnDesconectarClick(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Ejecuto el procedimiento de Desconectar el Sistema
        DesconectarElSistema;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuDesconectarClick(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Ejecuto el procedimiento de Desconectar el Sistema
        DesconectarElSistema;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuVerReporteCuentasDeUsuarioClick(
  Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Previsualizo el Reporte de Cuentas de Usuarios
        PrevisualizarReporteCuentasDeUsuario;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuVerReporteTrazasDelSistemaClick(
  Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Previsualizo el Reporte de Trazas del Sistema
        PrevisualizarReporteTrazasDelSistema;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuVerDetallesDeTrazaClick(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Detallo la Traza del Sistema
        DetallarTrazaDelSistema;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuAgregarCuentaDeUsuarioClick(
  Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Agrego una nueva Cuenta de Usuario
        AgregarCuentaDeUsuario;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuModificarCuentaDeUsuarioClick(
  Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Modifico la Cuenta de Usuario seleccionada
        ModificarCuentaDeUsuario;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuEliminarCuentaDeUsuarioClick(
  Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Elimino la Cuenta de Usuario seleccionada
        EliminarCuentaDeUsuario;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuExportarReporteCuentasDeUsuarioClick(
  Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Exporto hacia PDF el Reporte de Cuentas de Usuarios
        ExportarHaciaPDFReporteCuentasDeUsuario;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuExportarReporteTrazasDelSistemaClick(
  Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Exporto hacia PDF el Reporte de Trazas del Sistema
        ExportarHaciaPDFReporteTrazasDelSistema;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuImprimirReporteCuentasDeUsuarioClick(
  Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Imprimo el Reporte de Cuentas de Usuarios
        ImprimirReporteCuentasDeUsuario;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuImprimirReporteTrazasDelSistemaClick(
  Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Imprimo el Reporte de Trazas del Sistema
        ImprimirReporteTrazasDelSistema;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuRestaurarBaseDeDatosClick(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Ejecuto el procedimiento de Restaurar Base de Datos
        RestaurarBaseDeDatos;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.barbtnRestaurarBaseDeDatosClick(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Ejecuto el procedimiento de Restaurar Base de Datos
        RestaurarBaseDeDatos;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SalvarBaseDeDatos;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Configuro el SaveDialog
        //SaveDialog.FileName:= '';
        SaveDialog.Filter:= 'Archivos de Respaldo del BookLogger (*.BBK)|*.BBK';
        SaveDialog.DefaultExt := '*.BBK';

        if (SaveDialog.Execute)
          then
            begin
              //Guardo la traza
              BookLogger.GuardarTrazaDelSistema('Realiz� una salva de la DB, hacia un fichero de nombre ' + ExtractFileName(SaveDialog.FileName));

              //Actualizo las Trazas del Sistema
              BookLogger.MostrarTodasLasTrazas;
              
              //Salvo la base de datos en forma de fichero
              //BookLogger.SalvarBaseDeDatosHostalWare(QuotedStr(   SaveDialogHostalWare.FileName + '.BAK'   ));
              BookLogger.SalvarBaseDeDatosHostalWare(SaveDialog.FileName + '.BBK'   );
            end;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.RestaurarBaseDeDatos;
begin
  //Le cambio el filter al OpenDialog de Simulacion
  OpenDialog.FileName:= '';
  OpenDialog.Filter:= 'Archivos de Respaldo del BookLogger (*.BBK)|*.BBK';
  OpenDialog.DefaultExt := '*.BBK';
  
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        if (OpenDialog.Execute)
          then
            begin
              //Restauro la base de datos, desde un fichero *.BBK (EXPERIMENTAL!!!!)
              BookLogger.RestaurarBaseDeDatosHostalWare(OpenDialog.FileName);

              //Guardo la traza
              BookLogger.GuardarTrazaDelSistema('Realiz� una restauraci�n de la DB, desde un fichero de nombre ' + ExtractFileName(OpenDialog.FileName) + '.BBK');

              //Actualizo las Trazas del Sistema
              BookLogger.MostrarTodasLasTrazas;              
            end;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.DesconectarElSistema;
begin
  //Inserto la Traza
  BookLogger.GuardarTrazaDelSistema('Sali� del sistema BookLogger');

  //Desloggeo al usuario
  BookLogger.DesloggearAlUsuario;

  //Me desconecto de la BD
  BookLogger.EliminarConexionConLaBD;

  //Material agregado
  if (BookLogger.ExisteConexionConLaBD = False)
    then
      begin
        //Desabilito las opciones de Desconectar el Sistema
        //barbtnDesconectar.Enabled:= False;
        //SubMenuDesconectar.Enabled:= False;

        //Cambio hacia la forma de loggin inicial
        frmPrincipal.Hide;
        frmValidacionPuestoDeTrabajo.ShowModal;



        //Material agregado, cuando se vuelve a entrar al sistema desde la forma de loggin inicial
        if (BookLogger.ExisteConexionConLaBD = True)
          then
            begin
              //Verifico de nuevo la conexi�n, por si se cancel� el Loggeo
              if (BookLogger.ExisteConexionConLaBD)
                then
                  begin
                    //Especifico que ya no es la primera vez que se entra
                    VecesEntrando:= VecesEntrando + 1;
              
                    //Muestro la forma principal
                    frmPrincipal.Show;
              
                    //Inserto la Traza
                    BookLogger.GuardarTrazaDelSistema('Entr� al sistema BookLogger');

                    //Muestro los datos en el DBGrid del M�dulo de Puestos de Trabajo
                    BookLogger.MostrarPuestosDeTrabajo;

                    //Actualizo todas las trazas
                    BookLogger.MostrarTodasLasTrazas;

                    //Decido qu� componentes mostrar en dependencia de los privilegios del Loggeado
                    if ( BookLogger.ElTrabajadorEsAdministrador = False)
                      then
                        begin //Se trata de un Operador
                          //Oculto la pesta�a de Control del Sistema
                          AdvTabSheetControlDelSistema.TabVisible:= False;
                        end
                          else
                            begin //Se trata de un Administrador
                              //Muestro la pesta�a de Control del Sistema
                              AdvTabSheetControlDelSistema.TabVisible:= True;
                            end;

                  end;//Fin de la segunda verificaci�n de conexi�n, por posible cancelaci�n de Loggeo
            end
              else
                begin
                  MessageDlg('No se pudo establecer conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n, o cierre el sistema.', mtError, [mbOk], 0);
                end;
      end;
end;



procedure TfrmPrincipal.PrevisualizarReporteCuentasDeUsuario;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //*** Usando QuickReport ***
        //Relleno los valores adicionales en el reporte
        //Especifico los DataSet de los componentes DB del QuickReport
        QuickReportCuentasDeUsuarios.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecPuestosDeTrabajo;

        QuickReportCuentasDeUsuarios.QRDBtxtUsuario.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecPuestosDeTrabajo;
        QuickReportCuentasDeUsuarios.QRDBtxtPrivilegio.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecPuestosDeTrabajo;
        QuickReportCuentasDeUsuarios.QRDBtxtNombre.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecPuestosDeTrabajo;
        QuickReportCuentasDeUsuarios.QRDBtxtPrimerApellido.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecPuestosDeTrabajo;
        QuickReportCuentasDeUsuarios.QRDBtxtSegundoApellido.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecPuestosDeTrabajo;        

        //Conformo los captions del QuickReport
        QuickReportCuentasDeUsuarios.QRlblReferente.Caption:= 'Reporte de las Cuentas de Usuarios.';
        QuickReportCuentasDeUsuarios.QRlblFechaEmitido.Caption:= 'Emitido el: ' + ObtenerFechaDelSistema;

        //Actualizo y muestro as Cuentas de Usuarios
        BookLogger.MostrarPuestosDeTrabajo;

        //Envio datos adicionales para el Preview
        frmPreviewReporteCuentasDeUsuarios.IdiomaImperante:= IdiomaImperante;
        frmPreviewReporteCuentasDeUsuarios.FechaDelSistema:= ObtenerFechaDelSistema;

        //Muestro el reporte (Quick Report, vista previa)
        QuickReportCuentasDeUsuarios.PreviewModal;

        QuickReportCuentasDeUsuarios.QRImageLogo.Refresh;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.PrevisualizarReporteInformeMES1164;
var
  Provincia: AnsiString;
  Anno: Integer;
  mes, dia, ano :Word;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //** Recojo el a�o **
        //Intento convertir parte de fecha hacia un n�mero entero (a�o)
        Anno:= StrToIntDef(   AnsiRightStr(DateToStr(dtpAnno.Date), 4 ), 0   );

        //Verifico si tom� el valor default = 0 (no es entero)
        if (Anno = 0)
          then
            begin
              //Decodifico el DateTimePicker en porciones de fecha
              DecodeDate(dtpAnno.Date, ano, mes, dia);

              //Tomo lo que me interesa (el a�o)
              Anno:= ano;
            end;

        //** Recojo la provincia **
        Provincia:= cmbxFiltrarPlanillas1164_01PorProvincia.Text;

        //Valido en dependencia de la provincia escogida
        if (Provincia = 'TODAS')
          then
            begin //De todas las provincias
              //Valido en dependencia del a�o escogido
              if (ckbxFiltrarPlanillas1164_01PorAnno.Checked = True)
                then
                  begin //Todas las provincias, para un a�o en espec�fico
                    //*** Usando QuickReport ***
                    //Relleno los valores adicionales en el reporte
                    //Especifico los DataSet de los componentes DB del QuickReport
                    QuickReportInformes1164_01.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorAnno;

                    QuickReportInformes1164_01.QRDBtxtAnno.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorAnno;
                    QuickReportInformes1164_01.QRDBtxtNombreCentroInformante.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorAnno;
                    QuickReportInformes1164_01.QRDBtxtProvincia.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorAnno;
                    QuickReportInformes1164_01.QRDBtxtMunicipio.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorAnno;

                    //Conformo los captions del QuickReport
                    QuickReportInformes1164_01.QRlblReferente.Caption:= 'Reporte de las Planillas 1164-01 del a�o ' + IntToStr(Anno) + '.';
                    QuickReportInformes1164_01.QRlblFechaEmitido.Caption:= 'Emitido el: ' + ObtenerFechaDelSistema;

                    //Actualizo y muestro las Planillas 1164-01
                    ActualizarInformesMES1164;

                    //Envio datos adicionales para el Preview
                    frmPreviewReporteInformes1164_01.IdiomaImperante:= IdiomaImperante;
                    frmPreviewReporteInformes1164_01.FechaDelSistema:= ObtenerFechaDelSistema;

                    //Muestro el reporte (Quick Report, vista previa)
                    QuickReportInformes1164_01.PreviewModal;

                    QuickReportInformes1164_01.QRImageLogo.Refresh;
                  end
                    else
                      begin //Todas las provincias, para todos los a�os
                        //*** Usando QuickReport ***
                        //Relleno los valores adicionales en el reporte
                        //Especifico los DataSet de los componentes DB del QuickReport
                        QuickReportInformes1164_01.DataSet:= DataModuleInformes.spSelecPlanillas1164_01Todas;

                        QuickReportInformes1164_01.QRDBtxtAnno.DataSet:= DataModuleInformes.spSelecPlanillas1164_01Todas;
                        QuickReportInformes1164_01.QRDBtxtNombreCentroInformante.DataSet:= DataModuleInformes.spSelecPlanillas1164_01Todas;
                        QuickReportInformes1164_01.QRDBtxtProvincia.DataSet:= DataModuleInformes.spSelecPlanillas1164_01Todas;
                        QuickReportInformes1164_01.QRDBtxtMunicipio.DataSet:= DataModuleInformes.spSelecPlanillas1164_01Todas;

                        //Conformo los captions del QuickReport
                        QuickReportInformes1164_01.QRlblReferente.Caption:= 'Reporte de Todas las Planillas 1164-01.';
                        QuickReportInformes1164_01.QRlblFechaEmitido.Caption:= 'Emitido el: ' + ObtenerFechaDelSistema;

                        //Actualizo y muestro las Planillas 1164-01
                        ActualizarInformesMES1164;

                        //Envio datos adicionales para el Preview
                        frmPreviewReporteInformes1164_01.IdiomaImperante:= IdiomaImperante;
                        frmPreviewReporteInformes1164_01.FechaDelSistema:= ObtenerFechaDelSistema;

                        //Muestro el reporte (Quick Report, vista previa)
                        QuickReportInformes1164_01.PreviewModal;

                        QuickReportInformes1164_01.QRImageLogo.Refresh;
                      end;
            end
              else
                begin //De una provincia en espec�fico
                  //Valido en dependencia del a�o escogido
                  if (ckbxFiltrarPlanillas1164_01PorAnno.Checked = True)
                    then
                      begin //Una provincia en espec�fico, para un a�o en espec�fico
                        //*** Usando QuickReport ***
                        //Relleno los valores adicionales en el reporte
                        //Especifico los DataSet de los componentes DB del QuickReport
                        QuickReportInformes1164_01.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno;

                        QuickReportInformes1164_01.QRDBtxtAnno.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno;
                        QuickReportInformes1164_01.QRDBtxtNombreCentroInformante.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno;
                        QuickReportInformes1164_01.QRDBtxtProvincia.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno;
                        QuickReportInformes1164_01.QRDBtxtMunicipio.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno;

                        //Conformo los captions del QuickReport
                        QuickReportInformes1164_01.QRlblReferente.Caption:= 'Reporte de las Planillas 1164-01 referentes al a�o ' + IntToStr(Anno) + ' y a la provincia ' + Provincia + '.';
                        QuickReportInformes1164_01.QRlblFechaEmitido.Caption:= 'Emitido el: ' + ObtenerFechaDelSistema;

                        //Actualizo y muestro las Planillas 1164-01
                        ActualizarInformesMES1164;

                        //Envio datos adicionales para el Preview
                        frmPreviewReporteInformes1164_01.IdiomaImperante:= IdiomaImperante;
                        frmPreviewReporteInformes1164_01.FechaDelSistema:= ObtenerFechaDelSistema;

                        //Muestro el reporte (Quick Report, vista previa)
                        QuickReportInformes1164_01.PreviewModal;

                        QuickReportInformes1164_01.QRImageLogo.Refresh;
                      end
                        else
                          begin //Una provincia en espec�fico, para todos los a�os
                            //*** Usando QuickReport ***
                            //Relleno los valores adicionales en el reporte
                            //Especifico los DataSet de los componentes DB del QuickReport
                            QuickReportInformes1164_01.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvincia;

                            QuickReportInformes1164_01.QRDBtxtAnno.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvincia;
                            QuickReportInformes1164_01.QRDBtxtNombreCentroInformante.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvincia;
                            QuickReportInformes1164_01.QRDBtxtProvincia.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvincia;
                            QuickReportInformes1164_01.QRDBtxtMunicipio.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvincia;

                            //Conformo los captions del QuickReport
                            QuickReportInformes1164_01.QRlblReferente.Caption:= 'Reporte de las Planillas 1164-01 referentes a la provincia ' + Provincia + '.';
                            QuickReportInformes1164_01.QRlblFechaEmitido.Caption:= 'Emitido el: ' + ObtenerFechaDelSistema;

                            //Actualizo y muestro las Planillas 1164-01
                            ActualizarInformesMES1164;

                            //Envio datos adicionales para el Preview
                            frmPreviewReporteInformes1164_01.IdiomaImperante:= IdiomaImperante;
                            frmPreviewReporteInformes1164_01.FechaDelSistema:= ObtenerFechaDelSistema;

                            //Muestro el reporte (Quick Report, vista previa)
                            QuickReportInformes1164_01.PreviewModal;

                            QuickReportInformes1164_01.QRImageLogo.Refresh;
                          end;
                end;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.PrevisualizarReporteTrazasDelSistema;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //*** Usando QuickReport ***
        //Relleno los valores adicionales en el reporte
        //Especifico los DataSet de los componentes DB del QuickReport
        QuickReportTrazasDelSistema.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecTodasLasTrazas;

        QuickReportTrazasDelSistema.QRDBtxtFecha.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecTodasLasTrazas;
        QuickReportTrazasDelSistema.QRDBtxtUsuario.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecTodasLasTrazas;
        QuickReportTrazasDelSistema.QRDBtxtAccionRealizada.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecTodasLasTrazas;

        //Conformo los captions del QuickReport
        QuickReportTrazasDelSistema.QRlblReferente.Caption:= 'Reporte de las Trazas del Sistema.';
        QuickReportTrazasDelSistema.QRlblFechaEmitido.Caption:= 'Emitido el: ' + ObtenerFechaDelSistema;

        //Actualizo y muestro las Trazas
        BookLogger.MostrarTodasLasTrazas;

        //Envio datos adicionales para el Preview
        frmPreviewReporteTrazasDelSistema.IdiomaImperante:= IdiomaImperante;
        frmPreviewReporteTrazasDelSistema.FechaDelSistema:= ObtenerFechaDelSistema;

        //Muestro el reporte (Quick Report, vista previa)
        QuickReportTrazasDelSistema.PreviewModal;

        QuickReportTrazasDelSistema.QRImageLogo.Refresh;

        //Actualizo y muestro las Trazas
        //BookLogger.MostrarTodasLasTrazas;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.ExportarHaciaPDFReporteCuentasDeUsuario;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Le cambio el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        //En dependencia del idioma imperante
        if (IdiomaImperante = 'Espannol')
          then
            begin
              frmPrincipal.Caption:= 'BookLogger. Exportando el Reporte de Cuentas de Usuarios a PDF';
            end
              else
                begin
                  if (IdiomaImperante = 'Ingles')
                    then
                      begin
                        frmPrincipal.Caption:= 'BookLogger. Exportando el Reporte de Cuentas de Usuarios a PDF';
                      end;
                end;

        //*** Usando QuickReport ***
        //Relleno los valores adicionales en el reporte
        //Especifico los DataSet de los componentes DB del QuickReport
        QuickReportTrazasDelSistema.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecTodasLasTrazas;

        QuickReportTrazasDelSistema.QRDBtxtFecha.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecTodasLasTrazas;
        QuickReportTrazasDelSistema.QRDBtxtUsuario.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecTodasLasTrazas;
        QuickReportTrazasDelSistema.QRDBtxtAccionRealizada.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecTodasLasTrazas;

        //Conformo los captions del QuickReport
        QuickReportTrazasDelSistema.QRlblReferente.Caption:= 'Reporte de las Trazas del Sistema.';
        QuickReportTrazasDelSistema.QRlblFechaEmitido.Caption:= 'Emitido el: ' + ObtenerFechaDelSistema;

        //Actualizo y muestro las Trazas
        BookLogger.MostrarTodasLasTrazas;

        //Envio datos adicionales para el Preview
        frmPreviewReporteTrazasDelSistema.IdiomaImperante:= IdiomaImperante;
        frmPreviewReporteTrazasDelSistema.FechaDelSistema:= ObtenerFechaDelSistema;

        
        //Le envio el reporte hacia el ExportQR
        //QuickReportHabitacionesExistentes.Prepare;
        EXQR.Report := QuickReportCuentasDeUsuarios;

        //Mando a que el ExportQR exporte el reporte ya almacenado
        EXQR.ExportQR;

        //Prob� exportando directamente hacia PDF pero salva en la raiz directamente, no saca la bandeja de di�logo
        //EXQR.ExportQRPDF('Resumen P. de Excelencia (' + ComboBoxSemestreResumenesDeExcelencia.Text + ' del a�o ' + anno + ') ' + DptoCapacitacion.ObtenerFechaDelSistema, False, True);
        //EXQR.ExportQRPDF('Hola', True); esta deber�a servir, pero no

        QuickReportCuentasDeUsuarios.QRPrinter.Free;
        QuickReportCuentasDeUsuarios.QRPrinter := nil;

        //Le restituyo el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        //En dependencia del idioma imperante
        if (IdiomaImperante = 'Espannol')
          then
            begin
              frmPrincipal.Caption:= 'BookLogger - Sistema de Control Docente Automatizado';
            end
              else
                begin
                  if (IdiomaImperante = 'Ingles')
                    then
                      begin
                        frmPrincipal.Caption:= 'BookLogger - Sistema de Control Docente Automatizado';
                      end;
                end;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.ExportarHaciaPDFReporteInformeMES1164;
var
  Provincia: AnsiString;
  Anno: Integer;
  mes, dia, ano :Word;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Le cambio el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        //En dependencia del idioma imperante
        if (IdiomaImperante = 'Espannol')
          then
            begin
              frmPrincipal.Caption:= 'BookLogger. Exportando el Reporte de Planillas 1164-01 a PDF';
            end
              else
                begin
                  if (IdiomaImperante = 'Ingles')
                    then
                      begin
                        frmPrincipal.Caption:= 'BookLogger. Exportando el Reporte de Planillas 1164-01 a PDF';
                      end;
                end;


        //** Recojo el a�o **
        //Intento convertir parte de fecha hacia un n�mero entero (a�o)
        Anno:= StrToIntDef(   AnsiRightStr(DateToStr(dtpAnno.Date), 4 ), 0   );

        //Verifico si tom� el valor default = 0 (no es entero)
        if (Anno = 0)
          then
            begin
              //Decodifico el DateTimePicker en porciones de fecha
              DecodeDate(dtpAnno.Date, ano, mes, dia);

              //Tomo lo que me interesa (el a�o)
              Anno:= ano;
            end;

        //** Recojo la provincia **
        Provincia:= cmbxFiltrarPlanillas1164_01PorProvincia.Text;

        //Valido en dependencia de la provincia escogida
        if (Provincia = 'TODAS')
          then
            begin //De todas las provincias
              //Valido en dependencia del a�o escogido
              if (ckbxFiltrarPlanillas1164_01PorAnno.Checked = True)
                then
                  begin //Todas las provincias, para un a�o en espec�fico
                    //*** Usando QuickReport ***
                    //Relleno los valores adicionales en el reporte
                    //Especifico los DataSet de los componentes DB del QuickReport
                    QuickReportInformes1164_01.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorAnno;

                    QuickReportInformes1164_01.QRDBtxtAnno.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorAnno;
                    QuickReportInformes1164_01.QRDBtxtNombreCentroInformante.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorAnno;
                    QuickReportInformes1164_01.QRDBtxtProvincia.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorAnno;
                    QuickReportInformes1164_01.QRDBtxtMunicipio.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorAnno;

                    //Conformo los captions del QuickReport
                    QuickReportInformes1164_01.QRlblReferente.Caption:= 'Reporte de las Planillas 1164-01 del a�o ' + IntToStr(Anno) + '.';
                    QuickReportInformes1164_01.QRlblFechaEmitido.Caption:= 'Emitido el: ' + ObtenerFechaDelSistema;

                    //Actualizo y muestro las Planillas 1164-01
                    ActualizarInformesMES1164;

                    //Le envio el reporte hacia el ExportQR
                    //QuickReportHabitacionesExistentes.Prepare;
                    EXQR.Report := QuickReportInformes1164_01;

                    //Mando a que el ExportQR exporte el reporte ya almacenado
                    EXQR.ExportQR;

                    //Prob� exportando directamente hacia PDF pero salva en la raiz directamente, no saca la bandeja de di�logo
                    //EXQR.ExportQRPDF('Resumen P. de Excelencia (' + ComboBoxSemestreResumenesDeExcelencia.Text + ' del a�o ' + anno + ') ' + DptoCapacitacion.ObtenerFechaDelSistema, False, True);
                    //EXQR.ExportQRPDF('Hola', True); esta deber�a servir, pero no

                    QuickReportInformes1164_01.QRPrinter.Free;
                    QuickReportInformes1164_01.QRPrinter := nil;


                    //---- *** A partir de aqu� restituyo el estado de los componentes *** ----

                    //Actualizo y muestro las Planillas 1164-01
                    ActualizarInformesMES1164;
                  end
                    else
                      begin //Todas las provincias, para todos los a�os
                        //*** Usando QuickReport ***
                        //Relleno los valores adicionales en el reporte
                        //Especifico los DataSet de los componentes DB del QuickReport
                        QuickReportInformes1164_01.DataSet:= DataModuleInformes.spSelecPlanillas1164_01Todas;

                        QuickReportInformes1164_01.QRDBtxtAnno.DataSet:= DataModuleInformes.spSelecPlanillas1164_01Todas;
                        QuickReportInformes1164_01.QRDBtxtNombreCentroInformante.DataSet:= DataModuleInformes.spSelecPlanillas1164_01Todas;
                        QuickReportInformes1164_01.QRDBtxtProvincia.DataSet:= DataModuleInformes.spSelecPlanillas1164_01Todas;
                        QuickReportInformes1164_01.QRDBtxtMunicipio.DataSet:= DataModuleInformes.spSelecPlanillas1164_01Todas;

                        //Conformo los captions del QuickReport
                        QuickReportInformes1164_01.QRlblReferente.Caption:= 'Reporte de Todas las Planillas 1164-01.';
                        QuickReportInformes1164_01.QRlblFechaEmitido.Caption:= 'Emitido el: ' + ObtenerFechaDelSistema;

                        //Actualizo y muestro las Planillas 1164-01
                        ActualizarInformesMES1164;

                        //Le envio el reporte hacia el ExportQR
                        //QuickReportHabitacionesExistentes.Prepare;
                        EXQR.Report := QuickReportInformes1164_01;

                        //Mando a que el ExportQR exporte el reporte ya almacenado
                        EXQR.ExportQR;

                        //Prob� exportando directamente hacia PDF pero salva en la raiz directamente, no saca la bandeja de di�logo
                        //EXQR.ExportQRPDF('Resumen P. de Excelencia (' + ComboBoxSemestreResumenesDeExcelencia.Text + ' del a�o ' + anno + ') ' + DptoCapacitacion.ObtenerFechaDelSistema, False, True);
                        //EXQR.ExportQRPDF('Hola', True); esta deber�a servir, pero no

                        QuickReportInformes1164_01.QRPrinter.Free;
                        QuickReportInformes1164_01.QRPrinter := nil;


                        //---- *** A partir de aqu� restituyo el estado de los componentes *** ----

                        //Actualizo y muestro las Planillas 1164-01
                        ActualizarInformesMES1164;
                      end;
            end
              else
                begin //De una provincia en espec�fico
                  //Valido en dependencia del a�o escogido
                  if (ckbxFiltrarPlanillas1164_01PorAnno.Checked = True)
                    then
                      begin //Una provincia en espec�fico, para un a�o en espec�fico
                        //*** Usando QuickReport ***
                        //Relleno los valores adicionales en el reporte
                        //Especifico los DataSet de los componentes DB del QuickReport
                        QuickReportInformes1164_01.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno;

                        QuickReportInformes1164_01.QRDBtxtAnno.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno;
                        QuickReportInformes1164_01.QRDBtxtNombreCentroInformante.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno;
                        QuickReportInformes1164_01.QRDBtxtProvincia.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno;
                        QuickReportInformes1164_01.QRDBtxtMunicipio.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno;

                        //Conformo los captions del QuickReport
                        QuickReportInformes1164_01.QRlblReferente.Caption:= 'Reporte de las Planillas 1164-01 referentes al a�o ' + IntToStr(Anno) + ' y a la provincia ' + Provincia + '.';
                        QuickReportInformes1164_01.QRlblFechaEmitido.Caption:= 'Emitido el: ' + ObtenerFechaDelSistema;

                        //Actualizo y muestro las Planillas 1164-01
                        ActualizarInformesMES1164;

                        //Le envio el reporte hacia el ExportQR
                        //QuickReportHabitacionesExistentes.Prepare;
                        EXQR.Report := QuickReportInformes1164_01;

                        //Mando a que el ExportQR exporte el reporte ya almacenado
                        EXQR.ExportQR;

                        //Prob� exportando directamente hacia PDF pero salva en la raiz directamente, no saca la bandeja de di�logo
                        //EXQR.ExportQRPDF('Resumen P. de Excelencia (' + ComboBoxSemestreResumenesDeExcelencia.Text + ' del a�o ' + anno + ') ' + DptoCapacitacion.ObtenerFechaDelSistema, False, True);
                        //EXQR.ExportQRPDF('Hola', True); esta deber�a servir, pero no

                        QuickReportInformes1164_01.QRPrinter.Free;
                        QuickReportInformes1164_01.QRPrinter := nil;


                        //---- *** A partir de aqu� restituyo el estado de los componentes *** ----

                        //Actualizo y muestro las Planillas 1164-01
                        ActualizarInformesMES1164;
                      end
                        else
                          begin //Una provincia en espec�fico, para todos los a�os
                            //*** Usando QuickReport ***
                            //Relleno los valores adicionales en el reporte
                            //Especifico los DataSet de los componentes DB del QuickReport
                            QuickReportInformes1164_01.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvincia;

                            QuickReportInformes1164_01.QRDBtxtAnno.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvincia;
                            QuickReportInformes1164_01.QRDBtxtNombreCentroInformante.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvincia;
                            QuickReportInformes1164_01.QRDBtxtProvincia.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvincia;
                            QuickReportInformes1164_01.QRDBtxtMunicipio.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvincia;

                            //Conformo los captions del QuickReport
                            QuickReportInformes1164_01.QRlblReferente.Caption:= 'Reporte de las Planillas 1164-01 referentes a la provincia ' + Provincia + '.';
                            QuickReportInformes1164_01.QRlblFechaEmitido.Caption:= 'Emitido el: ' + ObtenerFechaDelSistema;

                            //Actualizo y muestro las Planillas 1164-01
                            ActualizarInformesMES1164;

                            //Le envio el reporte hacia el ExportQR
                            //QuickReportHabitacionesExistentes.Prepare;
                            EXQR.Report := QuickReportInformes1164_01;

                            //Mando a que el ExportQR exporte el reporte ya almacenado
                            EXQR.ExportQR;

                            //Prob� exportando directamente hacia PDF pero salva en la raiz directamente, no saca la bandeja de di�logo
                            //EXQR.ExportQRPDF('Resumen P. de Excelencia (' + ComboBoxSemestreResumenesDeExcelencia.Text + ' del a�o ' + anno + ') ' + DptoCapacitacion.ObtenerFechaDelSistema, False, True);
                            //EXQR.ExportQRPDF('Hola', True); esta deber�a servir, pero no

                            QuickReportInformes1164_01.QRPrinter.Free;
                            QuickReportInformes1164_01.QRPrinter := nil;


                            //---- *** A partir de aqu� restituyo el estado de los componentes *** ----

                            //Actualizo y muestro las Planillas 1164-01
                            ActualizarInformesMES1164;
                          end;
                end;

        //Le restituyo el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        //En dependencia del idioma imperante
        if (IdiomaImperante = 'Espannol')
          then
            begin
              frmPrincipal.Caption:= 'BookLogger - Sistema de Control Docente Automatizado';
            end
              else
                begin
                  if (IdiomaImperante = 'Ingles')
                    then
                      begin
                        frmPrincipal.Caption:= 'BookLogger - Sistema de Control Docente Automatizado';
                      end;
                end;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.ExportarHaciaPDFReporteTrazasDelSistema;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Le cambio el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        //En dependencia del idioma imperante
        if (IdiomaImperante = 'Espannol')
          then
            begin
              frmPrincipal.Caption:= 'BookLogger. Exportando el Reporte de Trazas del Sistema a PDF';
            end
              else
                begin
                  if (IdiomaImperante = 'Ingles')
                    then
                      begin
                        frmPrincipal.Caption:= 'BookLogger. Exportando el Reporte de Trazas del Sistema a PDF';
                      end;
                end;
                      
        //*** Usando QuickReport ***
        //Relleno los valores adicionales en el reporte
        //Especifico los DataSet de los componentes DB del QuickReport
        QuickReportTrazasDelSistema.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecTodasLasTrazas;

        QuickReportTrazasDelSistema.QRDBtxtFecha.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecTodasLasTrazas;
        QuickReportTrazasDelSistema.QRDBtxtUsuario.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecTodasLasTrazas;
        QuickReportTrazasDelSistema.QRDBtxtAccionRealizada.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecTodasLasTrazas;

        //Conformo los captions del QuickReport
        QuickReportTrazasDelSistema.QRlblReferente.Caption:= 'Reporte de las Trazas del Sistema.';
        QuickReportTrazasDelSistema.QRlblFechaEmitido.Caption:= 'Emitido el: ' + ObtenerFechaDelSistema;

        //Actualizo y muestro las Trazas
        BookLogger.MostrarTodasLasTrazas;

        //Le envio el reporte hacia el ExportQR
        //QuickReportHabitacionesExistentes.Prepare;
        EXQR.Report := QuickReportTrazasDelSistema;

        //Mando a que el ExportQR exporte el reporte ya almacenado
        EXQR.ExportQR;

        //Prob� exportando directamente hacia PDF pero salva en la raiz directamente, no saca la bandeja de di�logo
        //EXQR.ExportQRPDF('Resumen P. de Excelencia (' + ComboBoxSemestreResumenesDeExcelencia.Text + ' del a�o ' + anno + ') ' + DptoCapacitacion.ObtenerFechaDelSistema, False, True);
        //EXQR.ExportQRPDF('Hola', True); esta deber�a servir, pero no

        QuickReportTrazasDelSistema.QRPrinter.Free;
        QuickReportTrazasDelSistema.QRPrinter := nil;


        //---- *** A partir de aqu� restituyo el estado de los componentes *** ----

        //Actualizo y muestro las Trazas
        BookLogger.MostrarTodasLasTrazas;

        //Le restituyo el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        //En dependencia del idioma imperante
        if (IdiomaImperante = 'Espannol')
          then
            begin
              frmPrincipal.Caption:= 'BookLogger - Sistema de Control Docente Automatizado';
            end
              else
                begin
                  if (IdiomaImperante = 'Ingles')
                    then
                      begin
                        frmPrincipal.Caption:= 'BookLogger - Sistema de Control Docente Automatizado';
                      end;
                end;
              
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.DetallarTrazaDelSistema;
label Ejecutar, Salida;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Verifico si existe al menos una Traza
        if (BookLogger.CantidadDeTrazas <> 0)
          then
            begin // Ejecuto el procedimiento
              goto Ejecutar;
            end
              else
                begin
                  //Salgo del procedimiento
                  goto Salida;
                end;
                
        //Label de ejecucion, cuando todo esta OK
        Ejecutar:

        //Muestro la forma de detalles de la Traza seleccionada
        frmDetallesDeTrazasDelSistema.Position:= poScreenCenter;
        frmDetallesDeTrazasDelSistema.ShowModal;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
          
  //Salida, cuando algo esta mal
  Salida:
end;



procedure TfrmPrincipal.ImprimirReporteCuentasDeUsuario;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //*** Usando QuickReport ***
        //Relleno los valores adicionales en el reporte
        //Especifico los DataSet de los componentes DB del QuickReport
        QuickReportCuentasDeUsuarios.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecPuestosDeTrabajo;

        QuickReportCuentasDeUsuarios.QRDBtxtUsuario.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecPuestosDeTrabajo;
        QuickReportCuentasDeUsuarios.QRDBtxtPrivilegio.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecPuestosDeTrabajo;
        QuickReportCuentasDeUsuarios.QRDBtxtNombre.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecPuestosDeTrabajo;
        QuickReportCuentasDeUsuarios.QRDBtxtPrimerApellido.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecPuestosDeTrabajo;
        QuickReportCuentasDeUsuarios.QRDBtxtSegundoApellido.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecPuestosDeTrabajo;        

        //Conformo los captions del QuickReport
        QuickReportCuentasDeUsuarios.QRlblReferente.Caption:= 'Reporte de las Cuentas de Usuarios.';
        QuickReportCuentasDeUsuarios.QRlblFechaEmitido.Caption:= 'Emitido el: ' + ObtenerFechaDelSistema;

        //Actualizo y muestro as Cuentas de Usuarios
        BookLogger.MostrarPuestosDeTrabajo;

        //Envio datos adicionales para el Preview
        frmPreviewReporteCuentasDeUsuarios.IdiomaImperante:= IdiomaImperante;
        frmPreviewReporteCuentasDeUsuarios.FechaDelSistema:= ObtenerFechaDelSistema;

        //Imprimo el reporte
        QuickReportCuentasDeUsuarios.Print;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.ImprimirReporteInformeMES1164;
var
  Provincia: AnsiString;
  Anno: Integer;
  mes, dia, ano :Word;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //** Recojo el a�o **
        //Intento convertir parte de fecha hacia un n�mero entero (a�o)
        Anno:= StrToIntDef(   AnsiRightStr(DateToStr(dtpAnno.Date), 4 ), 0   );

        //Verifico si tom� el valor default = 0 (no es entero)
        if (Anno = 0)
          then
            begin
              //Decodifico el DateTimePicker en porciones de fecha
              DecodeDate(dtpAnno.Date, ano, mes, dia);

              //Tomo lo que me interesa (el a�o)
              Anno:= ano;
            end;

        //** Recojo la provincia **
        Provincia:= cmbxFiltrarPlanillas1164_01PorProvincia.Text;

        //Valido en dependencia de la provincia escogida
        if (Provincia = 'TODAS')
          then
            begin //De todas las provincias
              //Valido en dependencia del a�o escogido
              if (ckbxFiltrarPlanillas1164_01PorAnno.Checked = True)
                then
                  begin //Todas las provincias, para un a�o en espec�fico
                    //*** Usando QuickReport ***
                    //Relleno los valores adicionales en el reporte
                    //Especifico los DataSet de los componentes DB del QuickReport
                    QuickReportInformes1164_01.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorAnno;

                    QuickReportInformes1164_01.QRDBtxtAnno.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorAnno;
                    QuickReportInformes1164_01.QRDBtxtNombreCentroInformante.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorAnno;
                    QuickReportInformes1164_01.QRDBtxtProvincia.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorAnno;
                    QuickReportInformes1164_01.QRDBtxtMunicipio.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorAnno;

                    //Conformo los captions del QuickReport
                    QuickReportInformes1164_01.QRlblReferente.Caption:= 'Reporte de las Planillas 1164-01 del a�o ' + IntToStr(Anno) + '.';
                    QuickReportInformes1164_01.QRlblFechaEmitido.Caption:= 'Emitido el: ' + ObtenerFechaDelSistema;

                    //Actualizo y muestro las Planillas 1164-01
                    ActualizarInformesMES1164;

                    //Imprimo el reporte
                    QuickReportInformes1164_01.Print;
                  end
                    else
                      begin //Todas las provincias, para todos los a�os
                        //*** Usando QuickReport ***
                        //Relleno los valores adicionales en el reporte
                        //Especifico los DataSet de los componentes DB del QuickReport
                        QuickReportInformes1164_01.DataSet:= DataModuleInformes.spSelecPlanillas1164_01Todas;

                        QuickReportInformes1164_01.QRDBtxtAnno.DataSet:= DataModuleInformes.spSelecPlanillas1164_01Todas;
                        QuickReportInformes1164_01.QRDBtxtNombreCentroInformante.DataSet:= DataModuleInformes.spSelecPlanillas1164_01Todas;
                        QuickReportInformes1164_01.QRDBtxtProvincia.DataSet:= DataModuleInformes.spSelecPlanillas1164_01Todas;
                        QuickReportInformes1164_01.QRDBtxtMunicipio.DataSet:= DataModuleInformes.spSelecPlanillas1164_01Todas;

                        //Conformo los captions del QuickReport
                        QuickReportInformes1164_01.QRlblReferente.Caption:= 'Reporte de Todas las Planillas 1164-01.';
                        QuickReportInformes1164_01.QRlblFechaEmitido.Caption:= 'Emitido el: ' + ObtenerFechaDelSistema;

                        //Actualizo y muestro las Planillas 1164-01
                        ActualizarInformesMES1164;

                        //Imprimo el reporte
                        QuickReportInformes1164_01.Print;
                      end;
            end
              else
                begin //De una provincia en espec�fico
                  //Valido en dependencia del a�o escogido
                  if (ckbxFiltrarPlanillas1164_01PorAnno.Checked = True)
                    then
                      begin //Una provincia en espec�fico, para un a�o en espec�fico
                        //*** Usando QuickReport ***
                        //Relleno los valores adicionales en el reporte
                        //Especifico los DataSet de los componentes DB del QuickReport
                        QuickReportInformes1164_01.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno;

                        QuickReportInformes1164_01.QRDBtxtAnno.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno;
                        QuickReportInformes1164_01.QRDBtxtNombreCentroInformante.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno;
                        QuickReportInformes1164_01.QRDBtxtProvincia.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno;
                        QuickReportInformes1164_01.QRDBtxtMunicipio.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno;

                        //Conformo los captions del QuickReport
                        QuickReportInformes1164_01.QRlblReferente.Caption:= 'Reporte de las Planillas 1164-01 referentes al a�o ' + IntToStr(Anno) + ' y a la provincia ' + Provincia + '.';
                        QuickReportInformes1164_01.QRlblFechaEmitido.Caption:= 'Emitido el: ' + ObtenerFechaDelSistema;

                        //Actualizo y muestro las Planillas 1164-01
                        ActualizarInformesMES1164;

                        //Imprimo el reporte
                        QuickReportInformes1164_01.Print;
                      end
                        else
                          begin //Una provincia en espec�fico, para todos los a�os
                            //*** Usando QuickReport ***
                            //Relleno los valores adicionales en el reporte
                            //Especifico los DataSet de los componentes DB del QuickReport
                            QuickReportInformes1164_01.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvincia;

                            QuickReportInformes1164_01.QRDBtxtAnno.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvincia;
                            QuickReportInformes1164_01.QRDBtxtNombreCentroInformante.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvincia;
                            QuickReportInformes1164_01.QRDBtxtProvincia.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvincia;
                            QuickReportInformes1164_01.QRDBtxtMunicipio.DataSet:= DataModuleInformes.spSelecPlanillas1164_01PorProvincia;

                            //Conformo los captions del QuickReport
                            QuickReportInformes1164_01.QRlblReferente.Caption:= 'Reporte de las Planillas 1164-01 referentes a la provincia ' + Provincia + '.';
                            QuickReportInformes1164_01.QRlblFechaEmitido.Caption:= 'Emitido el: ' + ObtenerFechaDelSistema;

                            //Actualizo y muestro las Planillas 1164-01
                            ActualizarInformesMES1164;

                            //Imprimo el reporte
                            QuickReportInformes1164_01.Print;
                          end;
                end;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.ImprimirReporteTrazasDelSistema;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //*** Usando QuickReport ***
        //Relleno los valores adicionales en el reporte
        //Especifico los DataSet de los componentes DB del QuickReport
        QuickReportTrazasDelSistema.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecTodasLasTrazas;

        QuickReportTrazasDelSistema.QRDBtxtFecha.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecTodasLasTrazas;
        QuickReportTrazasDelSistema.QRDBtxtUsuario.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecTodasLasTrazas;
        QuickReportTrazasDelSistema.QRDBtxtAccionRealizada.DataSet:= DataModuleControlDelSistema.ADOStoredProcSelecTodasLasTrazas;

        //Conformo los captions del QuickReport
        QuickReportTrazasDelSistema.QRlblReferente.Caption:= 'Reporte de las Trazas del Sistema.';
        QuickReportTrazasDelSistema.QRlblFechaEmitido.Caption:= 'Emitido el: ' + ObtenerFechaDelSistema;

        //Actualizo y muestro las Trazas
        BookLogger.MostrarTodasLasTrazas;

        //Envio datos adicionales para el Preview
        frmPreviewReporteTrazasDelSistema.IdiomaImperante:= IdiomaImperante;
        frmPreviewReporteTrazasDelSistema.FechaDelSistema:= ObtenerFechaDelSistema;

        //Imprimo el reporte
        QuickReportTrazasDelSistema.Print;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.CerrarLaAplicacion;
begin
  //En dependencia del idioma imperante
  if (IdiomaImperante = 'Espannol')
    then
      begin
        if MessageDlg('�Desea cerrar el sistema BookLogger?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
          then
            begin
              //Compruebo si existe conexi�n con la BD
              if (BookLogger.ExisteConexionConLaBD)
                then
                  begin
                    //Inserto la Traza
                    BookLogger.GuardarTrazaDelSistema('Sali� del sistema BookLogger');

                    //Actualizo todas las trazas
                    BookLogger.MostrarTodasLasTrazas;

                    //Desloggeo al usuario
                    BookLogger.DesloggearAlUsuario;

                    //Me desconecto de la BD
                    BookLogger.EliminarConexionConLaBD;
                  end;

              //Restituyo la resoluci�n de la pantalla
              CambiarResolucion(AnchoOriginalPantalla, AltoOriginalPantalla);

              //Termino la aplicaci�n
              Application.Terminate;
            end;
      end
        else
          begin
            if (IdiomaImperante = 'Ingles')
              then
                begin
                  if MessageDlg('Do you want to close the BookLogger system?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
                    then
                      begin
                        //Compruebo si existe conexi�n con la BD
                        if (BookLogger.ExisteConexionConLaBD)
                          then
                            begin
                              //Inserto la Traza
                              BookLogger.GuardarTrazaDelSistema('Sali� del sistema BookLogger');

                              //Actualizo todas las trazas
                              BookLogger.MostrarTodasLasTrazas;

                              //Desloggeo al usuario
                              BookLogger.DesloggearAlUsuario;

                              //Me desconecto de la BD
                              BookLogger.EliminarConexionConLaBD;
                            end;

                        //Restituyo la resoluci�n de la pantalla
                        CambiarResolucion(AnchoOriginalPantalla, AltoOriginalPantalla);

                        //Termino la aplicaci�n
                        Application.Terminate;
                      end;
                end
                  else
                    begin //Otro lenguaje aun no comprendido, o sino por edicion no autorizada del fichero de idioma
                      //Compruebo si existe conexi�n con la BD
                      if (BookLogger.ExisteConexionConLaBD)
                        then
                          begin
                            //Inserto la Traza
                            BookLogger.GuardarTrazaDelSistema('Sali� del sistema BookLogger');
                                                                                 
                            //Actualizo todas las trazas
                            BookLogger.MostrarTodasLasTrazas;

                            //Desloggeo al usuario
                            BookLogger.DesloggearAlUsuario;

                            //Me desconecto de la BD
                            BookLogger.EliminarConexionConLaBD;
                          end;
                          
                      //Restituyo la resoluci�n de la pantalla
                      CambiarResolucion(AnchoOriginalPantalla, AltoOriginalPantalla);

                      //Termino la aplicaci�n
                      Application.Terminate;
                    end;
          end;
end;



procedure TfrmPrincipal.AgregarCuentaDeUsuario;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Le cambio el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        frmPrincipal.Caption:= 'BookLogger, Cuentas de Usuario. Creando una nueva cuenta.';

        //Muestro la forma de entrada de Puestos de Trabajo
        frmNuevoPuestoDeTrabajo.Position:= poScreenCenter;
        frmNuevoPuestoDeTrabajo.ShowModal;

        //Actualizo el DBGrid de Puestos de Trabajo
        ActualizarCuentasDeUsuario;

        //Le restituyo el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        frmPrincipal.Caption:= 'BookLogger - Sistema de Control Docente Automatizado';
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.EliminarCuentaDeUsuario;
var
  usuario: AnsiString;
  NombreCompleto: String;
  Privilegios: String;
  label Ejecutar, Salida;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Debo verificar si existe al menos una Cuenta de Usuario
        if (BookLogger.CantidadDePuestosDeTrabajo <> 0)
          then
            begin //Ejecuto el procedimiento
              goto Ejecutar;
            end
              else
                begin
                  //Salgo del procedimiento
                  goto salida;
                end;

        //Label de Ejecucion, cuando todo est� OK
        Ejecutar:

        //Lleno las variables con el usuario seleccionado en el DBGrid de Cuentas de Usuario
        usuario:= DBGridPuestosDeTrabajo.SelectedField.Value;

        if (usuario <> 'booklogger')
          then
            begin
              //Le cambio el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
              frmPrincipal.Caption:= 'BookLogger, Cuentas de Usuario. Eliminando la Cuenta, con el usuario: ' + usuario + '.';

              //Deshabilito el bot�n de 'Nueva Cuenta de Usuario'
              lblbtnNuevaCuentaDeUsuario.Enabled:= False;

              //Deshabilito el SpeedButton de "Nueva Cuenta de Usuario"
              //SpeedButtonNuevoPuestosDeTrabajo.Enabled:= False;

              //Deshabilito la opci�n de "Nueva Cuenta de Usuario" en el MainMenu
              //MenuOpcionAgregarPuestoDeTrabajo.Enabled:= False;

              //Deshabilito el bot�n de "Modificar Cuenta de Usuario"
              lblbtnModificarCuentaDeUsuario.Enabled:= False;

              //Deshabilito el SpeedButton de "Modificar Cuenta de Usuario"
              //SpeedButtonModificarPuestosDeTrabajo.Enabled:= False;

              //Deshabilito la opci�n de "Modificar Cuenta de Usuario" del MainMenu
              //MenuOpcionModificarPuestoDeTrabajo.Enabled:= False;

              //Deshabilito el bot�n de "Eliminar Cuenta de Usuario"
              lblbtnEliminarCuentaDeUsuario.Enabled:= False;

              //Deshabilito el SpeedButton de "Eliminar Cuenta de Usuario"
              //SpeedButtonEliminarPuestosDeTrabajo.Enabled:= False;

              //Deshabilito la opci�n de "Eliminar Cuenta de Usuario" del MainMenu
              //MenuOpcionEliminarPuestoDeTrabajo.Enabled:= False;

              //Verifico que la Cuenta de Usuario que se borrar� no sea el mismo Loggeado
              if (BookLogger.ElUsuarioEstaLoggeado(usuario) = False)
                then
                  begin //No es el usuario loggeado
                    //Muestro mensaje al usuario una confirmaci�n de borrado
                    if MessageDlg('�Desea eliminar la Cuenta de Usuario seleccionada, con el usuario: ' + usuario + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
                      then
                        begin
                          //Relleno los otros campos que integran la traza
                          NombreCompleto:= DBTextNombre.Field.Text + ' ' + DBTextPrimerApellido.Field.Text + ' ' + DBTextSegundoApellido.Field.Text;
                          Privilegios:= DBTextPrivilegios.Field.Text;
              
                          //Realizo el borrado de la Cuenta de Usuario en la BD
                          BookLogger.EliminarPuestoDeTrabajo(usuario);

                          //Actualizar el DBGrid de las Cuentas de Usuario
                          BookLogger.MostrarPuestosDeTrabajo;

                          //Actualizo las Cuentas de Usuario
                          ActualizarCuentasDeUsuario;

                          //Inserto la Traza
                          BookLogger.GuardarTrazaDelSistema('Elimin� la Cuenta de Usuario ' + '"' + usuario + '"' + ' con privilegios de ' + Privilegios + ' y perteneciente a ' + NombreCompleto + '.');

                          //Actualizo todas las trazas
                          BookLogger.MostrarTodasLasTrazas;

                          //Muestro la cantidad de Cuentas de Usuario que existen creadas en la BD
                          lblCantidadPuestosDeTrabajo.Caption:= 'TOTAL = ' + IntToStr(BookLogger.CantidadDePuestosDeTrabajo) + ' Cuentas de Usuario.' ;

                          //Le restituyo el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
                          frmPrincipal.Caption:= 'BookLogger - Sistema de Control Docente Automatizado';

                          //Muestro mensaje de informaci�n del borrado ya realizado
                          MessageDlg('La Cuenta de Usuario, con el usuario ' + usuario + ', ha sido eliminado.', mtInformation, [mbOk], 0);  //, mbOk

                          //Habilito el bot�n de 'Nueva Cuenta de Usuario'
                          lblbtnNuevaCuentaDeUsuario.Enabled:= True;

                          //Habilito el SpeedButton de "Nuevo Cuenta de Usuario"
                          //SpeedButtonNuevoPuestosDeTrabajo.Enabled:= True;

                          //Habilito la opci�n de "Nueva Cuenta de Usuario" en el MainMenu
                          //MenuOpcionAgregarPuestoDeTrabajo.Enabled:= True;

                          //Habilito el bot�n de "Modificar Cuenta de Usuario"
                          lblbtnModificarCuentaDeUsuario.Enabled:= True;

                          //Habilito el SpeedButton de "Modificar Cuenta de Usuario"
                          //SpeedButtonModificarPuestosDeTrabajo.Enabled:= True;

                          //Habilito la opci�n de "Modificar Cuenta de Usuario" del MainMenu
                          //MenuOpcionModificarPuestoDeTrabajo.Enabled:= True;

                          //Habilito el bot�n de "Eliminar Cuenta de Usuario"
                          lblbtnEliminarCuentaDeUsuario.Enabled:= True;

                          //Habilito el SpeedButton de "Eliminar Cuenta de Usuario"
                          //SpeedButtonEliminarPuestosDeTrabajo.Enabled:= True;

                          //Habilito la opci�n de "Eliminar Cuenta de Usuario" del MainMenu
                          //MenuOpcionEliminarPuestoDeTrabajo.Enabled:= True;
                        end
                          else
                            begin // *** No se realiza borrado alguno. Todo se coloca como estaba antes ***
                              //Le restituyo el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
                              frmPrincipal.Caption:= 'BookLogger - Sistema de Control Docente Automatizado';

                              //Habilito el bot�n de 'Nueva Cuenta de Usuario'
                              lblbtnNuevaCuentaDeUsuario.Enabled:= True;

                              //Habilito el SpeedButton de "Nueva Cuenta de Usuario"
                              //SpeedButtonNuevoPuestosDeTrabajo.Enabled:= True;

                              //Habilito la opci�n de "Nueva Cuenta de Usuario" en el MainMenu
                              //MenuOpcionAgregarPuestoDeTrabajo.Enabled:= True;

                              //Habilito el bot�n de "Modificar Cuenta de Usuario"
                              lblbtnModificarCuentaDeUsuario.Enabled:= True;

                              //Habilito el SpeedButton de "Modificar Cuenta de Usuario"
                              //SpeedButtonModificarPuestosDeTrabajo.Enabled:= True;

                              //Habilito la opci�n de "Modificar Cuenta de Usuario" del MainMenu
                              //MenuOpcionModificarPuestoDeTrabajo.Enabled:= True;

                              //Habilito el bot�n de "Eliminar Cuenta de Usuario"
                              lblbtnEliminarCuentaDeUsuario.Enabled:= True;

                              //Habilito el SpeedButton de "Eliminar Cuenta de Usuario"
                              //SpeedButtonEliminarPuestosDeTrabajo.Enabled:= True;

                              //Habilito la opci�n de "Eliminar Cuenta de Usuario" del MainMenu
                              //MenuOpcionEliminarPuestoDeTrabajo.Enabled:= True;
                            end;
                  end
                    else
                      begin //Es el mismo usuario que est� loggeado
                        //Muestro mensaje al usuario una confirmaci�n de borrado
                        if MessageDlg('�Desea realmente eliminar la Cuenta de Usuario seleccionada, con el usuario: ' + usuario + '?' + ' Usted est� loggeado usando esa Cuenta de Usuario, por lo que autom�ticamente saldr� del sistema.', mtConfirmation, [mbYes, mbNo], 0) = mrYes
                          then
                            begin
                              //Relleno los otros campos que integran la traza
                              NombreCompleto:= DBTextNombre.Field.Text + ' ' + DBTextPrimerApellido.Field.Text + ' ' + DBTextSegundoApellido.Field.Text;
                              Privilegios:= DBTextPrivilegios.Field.Text;

                              //Realizo el borrado de la Cuenta de Usuario en la BD
                              BookLogger.EliminarPuestoDeTrabajo(usuario);

                              //Actualizar el DBGrid de las Cuentas de Usuario
                              BookLogger.MostrarPuestosDeTrabajo;

                              //Inserto la Traza
                              BookLogger.GuardarTrazaDelSistema('Elimin� la Cuenta de Usuario ' + '"' + usuario + '"' + ' con privilegios de ' + Privilegios + ' y perteneciente a ' + NombreCompleto + '. Como estaba loggeado usando esa misma Cuenta de Usuario, fue autom�ticamente expulsado del sistema.');

                              //Actualizo todas las trazas
                              BookLogger.MostrarTodasLasTrazas;
                                                            
                              //Muestro la cantidad de Cuentas de Usuario que existen creadas en la BD
                              lblCantidadPuestosDeTrabajo.Caption:= 'TOTAL = ' + IntToStr(BookLogger.CantidadDePuestosDeTrabajo) + ' Cuentas de Usuario.' ;

                              //Le restituyo el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
                              frmPrincipal.Caption:= 'BookLogger - Sistema de Control Docente Automatizado';

                              //Muestro mensaje de informaci�n del borrado ya realizado
                              MessageDlg('La Cuenta de Usuario, con el usuario ' + usuario + ', ha sido eliminado.', mtInformation, [mbOk], 0);  //, mbOk

                              //Habilito el bot�n de 'Nueva Cuenta de Usuario'
                              lblbtnNuevaCuentaDeUsuario.Enabled:= True;

                              //Habilito el SpeedButton de "Nueva Cuenta de Usuario"
                              //SpeedButtonNuevoPuestosDeTrabajo.Enabled:= True;

                              //Habilito la opci�n de "Nueva Cuenta de Usuario" en el MainMenu
                              //MenuOpcionAgregarPuestoDeTrabajo.Enabled:= True;

                              //Habilito el bot�n de "Modificar Cuenta de Usuario"
                              lblbtnModificarCuentaDeUsuario.Enabled:= True;

                              //Habilito el SpeedButton de "Modificar Cuenta de Usuario"
                              //SpeedButtonModificarPuestosDeTrabajo.Enabled:= True;

                              //Habilito la opci�n de "Modificar Cuenta de Usuario" del MainMenu
                              //MenuOpcionModificarPuestoDeTrabajo.Enabled:= True;

                              //Habilito el bot�n de "Eliminar Cuenta de Usuario"
                              lblbtnEliminarCuentaDeUsuario.Enabled:= True;

                              //Habilito el SpeedButton de "Eliminar Cuenta de Usuario"
                              //SpeedButtonEliminarPuestosDeTrabajo.Enabled:= True;

                              //Habilito la opci�n de "Eliminar Cuenta de Usuario" del MainMenu
                              //MenuOpcionEliminarPuestoDeTrabajo.Enabled:= True;

                              //Salgo del sistema
                              //SpeedButtonDesconectarsePuestosDeTrabajo.Click;
                              
                              //Actualizo las Cuentas de Usuario
                              ActualizarCuentasDeUsuario;

                              //Desconecto el sistema (el mismo borr� su propia cuenta de usuario)
                              DesconectarElSistema;
                            end
                              else
                                begin // *** No se realiza borrado alguno. Todo se coloca como estaba antes ***
                                  //Le restituyo el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
                                  frmPrincipal.Caption:= 'BookLogger - Sistema de Control Docente Automatizado';

                                  //Habilito el bot�n de 'Nueva Cuenta de Usuario'
                                  lblbtnNuevaCuentaDeUsuario.Enabled:= True;

                                  //Habilito el SpeedButton de "Nueva Cuenta de Usuario"
                                  //SpeedButtonNuevoPuestosDeTrabajo.Enabled:= True;

                                  //Habilito la opci�n de "Nueva Cuenta de Usuario" en el MainMenu
                                  //MenuOpcionAgregarPuestoDeTrabajo.Enabled:= True;

                                  //Habilito el bot�n de "Modificar Cuenta de Usuario"
                                  lblbtnModificarCuentaDeUsuario.Enabled:= True;

                                  //Habilito el SpeedButton de "Modificar Cuenta de Usuario"
                                  //SpeedButtonModificarPuestosDeTrabajo.Enabled:= True;

                                  //Habilito la opci�n de "Modificar Cuenta de Usuario" del MainMenu
                                  //MenuOpcionModificarPuestoDeTrabajo.Enabled:= True;

                                  //Habilito el bot�n de "Eliminar Cuenta de Usuario"
                                  lblbtnEliminarCuentaDeUsuario.Enabled:= True;

                                  //Habilito el SpeedButton de "Eliminar Cuenta de Usuario"
                                  //SpeedButtonEliminarPuestosDeTrabajo.Enabled:= True;

                                  //Habilito la opci�n de "Eliminar Cuenta de Usuario" del MainMenu
                                  //MenuOpcionEliminarPuestoDeTrabajo.Enabled:= True;
                                end;
                      end;
            end
              else
                begin
                  //Application.MessageBox('Usted no puede eliminar la Cuenta de Usuario "booklogger", pues es' + #13 + 'b�sica para el funcionamiento y administraci�n del sistema.','Informaci�n',mb_Ok + MB_ICONINFORMATION);
                  ShowMessage('Usted no puede eliminar la Cuenta de Usuario "booklogger", pues es' + #13 + 'b�sica para el funcionamiento y administraci�n del sistema BookLogger.');
                end;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;

  //Label de Salida, cuando algo est� mal
  Salida:
end;



procedure TfrmPrincipal.ModificarCuentaDeUsuario;
var
  usuario: AnsiString;
  label Ejecutar, Salida;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Debo verificar si existe al menos una Cuenta de Usuario
        if (BookLogger.CantidadDePuestosDeTrabajo <> 0)
          then
            begin //Ejecuto el procedimiento
              goto Ejecutar;
            end
              else
                begin
                  //Salgo del procedimiento
                  goto salida;
                end;

        //Label de Ejecucion, cuando todo est� OK
        Ejecutar:

        //Tomo el usuario del que est� seleccionado en el DBGrid
        usuario := DBGridPuestosDeTrabajo.SelectedField.Value;
  
        //Le cambio el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        frmPrincipal.Caption:= 'BookLogger, Cuentas de Usuario. Modificando la Cuenta, con el usuario: ' + usuario + '.';

        //Envio el id_Usuario desde el DBGrid de Cuentas de Usuario hacia la forma de modificaci�n de Cuentas de Usuario
        frmModificarPuestoDeTrabajo.TempViejoUsuario:= usuario;

        //Muestro la forma de Modificaci�n de Cuentas de Usuario
        frmModificarPuestoDeTrabajo.Position:= poScreenCenter;
        frmModificarPuestoDeTrabajo.ShowModal;

        //Actualizo las Cuentas de Usuario
        ActualizarCuentasDeUsuario;

        //Se verifica nuevamente los privilegios del loggeado, por si acaso el mismo se los cambi�
        if (BookLogger.ElLoggeadoEsAdministrador = False)
          then
            begin
              if (PestannaActiva = 'PuestosDeTrabajo')
                then
                  begin
                    //ValidarComponentesPuestosDeTrabajo;
                  end;

              if (PestannaActiva = 'TrazasDelSistema')
                then
                  begin
                    //ValidarComponentesTrazasDelSistema;
                  end;

              //Oculto el PageControl de Control del Sistema
              //PageControlControlDelSistema.Visible:= False;

              //Oculto el ToolBar de la pesta�a de Control del Sistema
              //ToolBarControlDelSistema.Visible:= False;

              //Oculto la pesta�a de Control del Sistema
              AdvTabSheetControlDelSistema.TabVisible:= False;
            end;

        //Le restituyo el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        frmPrincipal.Caption:= 'BookLogger - Sistema de Control Docente Automatizado';
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
  //Label de Salida, cuando algo est� mal
  Salida:
end;



procedure TfrmPrincipal.ModificarInformeMES1164;
var
  Provincia: AnsiString;
  ID_Planilla: Integer;

label Ejecutar, Salida;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //** Recojo la provincia **
        Provincia:= cmbxFiltrarPlanillas1164_01PorProvincia.Text;

        //Valido en dependencia de la provincia escogida
        if (Provincia = 'TODAS')
          then
            begin //De todas las provincias
              //Valido en dependencia del a�o escogido
              if (ckbxFiltrarPlanillas1164_01PorAnno.Checked = True)
                then
                  begin //Todas las provincias, para un a�o en espec�fico
                    //Valido si puedo ejecutar el procedimiento, a partir de la cantidad de planillas
                    if (BookLogger.CantidadPlanillas1164_01PorAnno = 0)
                      then
                        begin
                          //Salgo del procedimiento
                          goto Salida;
                        end
                          else
                            begin
                              //Ejecuto el procedimiento
                              goto Ejecutar;
                            end;
                  end
                    else
                      begin //Todas las provincias, para todos los a�os
                        //Valido si puedo ejecutar el procedimiento, a partir de la cantidad de planillas
                        if (BookLogger.CantidadPlanillas1164_01Todas = 0)
                          then
                            begin
                              //Salgo del procedimiento
                              goto Salida;
                            end
                              else
                                begin
                                  //Ejecuto el procedimiento
                                  goto Ejecutar;
                                end;
                      end;
            end
              else
                begin //De una provincia en espec�fico
                  //Valido en dependencia del a�o escogido
                  if (ckbxFiltrarPlanillas1164_01PorAnno.Checked = True)
                    then
                      begin //Una provincia en espec�fico, para un a�o en espec�fico
                        //Valido si puedo ejecutar el procedimiento, a partir de la cantidad de planillas
                        if (BookLogger.CantidadPlanillas1164_01PorProvinciaYAnno = 0)
                          then
                            begin
                              //Salgo del procedimiento
                              goto Salida;
                            end
                              else
                                begin
                                  //Ejecuto el procedimiento
                                  goto Ejecutar;
                                end;
                      end
                        else
                          begin //Una provincia en espec�fico, para todos los a�os
                            //Valido si puedo ejecutar el procedimiento, a partir de la cantidad de planillas
                            if (BookLogger.CantidadPlanillas1164_01PorProvincia = 0)
                              then
                                begin
                                  //Salgo del procedimiento
                                  goto Salida;
                                end
                                  else
                                    begin
                                      //Ejecuto el procedimiento
                                      goto Ejecutar;
                                    end;
                          end;
                end;

        //Label de Ejecucion, cuando todo est� OK
        Ejecutar:

        //Le cambio el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        frmPrincipal.Caption:= 'BookLogger, Informes al M.E.S. - Modelo 1164-01. Modificando una Planilla 1164-01';

        //Recojo el ID_Planilla
        ID_Planilla:= StrToInt(DBtxtID_Planilla1164_01.Field.Text);

        //Envio el ID_Planilla a la forma de modificacion
        frmModificarPlanilla1164_01.FID_Planilla:= ID_Planilla;

        //Envio la provincia a la forma de modificacion
        frmModificarPlanilla1164_01.FProvincia:= DBtxtProvinciaPlanilla1164_01.Field.Text;

        //Muestro la forma de Modificaci�n de Planilla 1164-01
        frmModificarPlanilla1164_01.Position:= poScreenCenter;
        frmModificarPlanilla1164_01.ShowModal;

        //Actualizo el DBGrid de Planillas 1164-01
        ActualizarInformesMES1164;

        //Le restituyo el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        frmPrincipal.Caption:= 'BookLogger - Sistema de Control Docente Automatizado';
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;

  //Label de Salida, cuando algo est� mal
  Salida:
end;




procedure TfrmPrincipal.MostrarAyudaGeneralDelSistema;
begin
  //Primero verifico si la ayuda general est� en su sitio
  if (FileExists(ExtractFilePath(Application.ExeName) + 'HelpFiles\BookLogger_es.chm') = True)
    then
      begin
        //Aqu� hago una llamada a la ayuda previamente echa.
        //Application.HelpContext(1);
        ShellExecute(Handle, 'open', Pchar(ExtractFilePath(Application.ExeName) + 'HelpFiles\BookLogger_es.chm' ), nil,nil, SW_SHOWNORMAL);
      end
        else
          begin
            MessageDlg('La ayuda no est� en su sitio o est� da�ado el archivo.' + #13 + 'No se puede mostrar la ayuda del sistema BookLogger.', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.ActualizarCuentasDeUsuario;
begin
  //Ante todo verifico que haya conexi�n hacia la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Verifico que exista el menos una Cuenta de Usuario
        if (BookLogger.CantidadDePuestosDeTrabajo > 0)
          then
            begin
              lblbtnModificarCuentaDeUsuario.Enabled:= True;
              lblbtnEliminarCuentaDeUsuario.Enabled:= True;

              SubMenuModificarCuentaDeUsuario.Enabled:= True;
              SubMenuEliminarCuentaDeUsuario.Enabled:= True;

              if (BookLogger.CantidadDePuestosDeTrabajo = 1)
                then
                  begin
                    //Muestro la cantidad de Cuentas de Usuario que existen creadas en la BD
                    lblCantidadPuestosDeTrabajo.Caption:= 'TOTAL = 1 Cuenta de Usuario' ;
                  end
                    else
                      begin
                        //Muestro la cantidad de Cuentas de Usuario que existen creadas en la BD
                        lblCantidadPuestosDeTrabajo.Caption:= 'TOTAL = ' + IntToStr(BookLogger.CantidadDePuestosDeTrabajo) + ' Cuentas de Usuario' ;
                      end;
            end
              else
                begin
                  lblbtnModificarCuentaDeUsuario.Enabled:= False;
                  lblbtnEliminarCuentaDeUsuario.Enabled:= False;

                  SubMenuModificarCuentaDeUsuario.Enabled:= False;
                  SubMenuEliminarCuentaDeUsuario.Enabled:= False;

                  //Muestro la cantidad de Cuentas de Usuario que existen creadas en la BD
                  lblCantidadPuestosDeTrabajo.Caption:= 'TOTAL = ' + IntToStr(BookLogger.CantidadDePuestosDeTrabajo) + ' Cuentas de Usuario' ;
                end;
      end
       else
         begin
           MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
         end;
end;


   
procedure TfrmPrincipal.SoloLetrasConEspaciosYPuntuacionKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [#13])
    then
      begin
        //Busco en los Archivos
      end;

  //Valido para solo nombres
  if not (Key in['a'..'z', 'A'..'Z', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', ' ', #8, #13]) then Abort;
end;



procedure TfrmPrincipal.SoloLetrasYNumerosSinPuntuacionNiEspaciosKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [#13])
    then
      begin
        //Busco en los Archivos
      end;
      
  //Valido para solo caracteres
  if not (Key in['a'..'z', 'A'..'Z', '0'..'9', #8, #13]) then Abort;
end;



procedure TfrmPrincipal.ActualizarInformesMES1164;
var
  Provincia: AnsiString;
  Anno: Integer;
  mes, dia, ano :Word;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //** Recojo el a�o **
        //Intento convertir parte de fecha hacia un n�mero entero (a�o)
        Anno:= StrToIntDef(   AnsiRightStr(DateToStr(dtpAnno.Date), 4 ), 0   );

        //Verifico si tom� el valor default = 0 (no es entero)
        if (Anno = 0)
          then
            begin
              //Decodifico el DateTimePicker en porciones de fecha
              DecodeDate(dtpAnno.Date, ano, mes, dia);

              //Tomo lo que me interesa (el a�o)
              Anno:= ano;
            end;

        //** Recojo la provincia **
        Provincia:= cmbxFiltrarPlanillas1164_01PorProvincia.Text;

        //Valido en dependencia de la provincia escogida
        if (Provincia = 'TODAS')
          then
            begin //De todas las provincias
              //Valido en dependencia del a�o escogido
              if (ckbxFiltrarPlanillas1164_01PorAnno.Checked = True)
                then
                  begin //Todas las provincias, para un a�o en espec�fico
                    //Cambio los DatSource de los componentes DB
                    DBGridPlanillas1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorAnno;
                    DBNavPlanillas1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorAnno;
                    DBtxtID_Planilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorAnno;
                    DBtxtAnnoPlanilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorAnno;
                    DBtxtNombreCentroInformantePlanilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorAnno;
                    DBtxtMunicipioPlanilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorAnno;
                    DBtxtProvinciaPlanilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorAnno;

                    //Muestro las planillas 1164-01 de todas las provincias, para un a�o en espec�fico
                    BookLogger.MostrarPlanillas1164_01PorAnno(Anno);

                    //Valido el estado de los botones, a partir de la cantidad de planillas
                    if (BookLogger.CantidadPlanillas1164_01PorAnno = 0)
                      then
                        begin
                          //Deshabilito los botones y submenus
                          btnModificarPlanilla1164_01.Enabled:= False;
                          btnEliminarPlanilla1164_01.Enabled:= False;
                          btnExportarPlanillaHaciaFichero.Enabled:= False;

                          SubMenuModificarPlanilla1164_01.Enabled:= False;
                          SubMenuEliminarPlanilla1164_01.Enabled:= False;
                          SubMenuExportarPlanilla1164_01HaciaFichero.Enabled:= False;
                        end
                          else
                            begin
                              //Habilito los botones y submenus
                              btnModificarPlanilla1164_01.Enabled:= True;
                              btnEliminarPlanilla1164_01.Enabled:= True;
                              btnExportarPlanillaHaciaFichero.Enabled:= True;

                              SubMenuModificarPlanilla1164_01.Enabled:= True;
                              SubMenuEliminarPlanilla1164_01.Enabled:= True;
                              SubMenuExportarPlanilla1164_01HaciaFichero.Enabled:= True;
                            end;

                    //Muestro la cantidad de planillas, de acuerdo al filtrado escogido
                    if (BookLogger.CantidadPlanillas1164_01PorAnno = 1)
                      then
                        begin
                          //Muestro la cantidad de planillas que existen creadas en la BD
                          lblCantidadPlanillas1164_01.Caption:= 'TOTAL = 1 Planilla' ;
                        end
                          else
                            begin
                              //Muestro la cantidad de planillas que existen creadas en la BD
                              lblCantidadPlanillas1164_01.Caption:= 'TOTAL = ' + IntToStr(BookLogger.CantidadPlanillas1164_01PorAnno) + ' Planillas' ;
                            end;

                  end
                    else
                      begin //Todas las provincias, para todos los a�os
                        //Cambio los DatSource de los componentes DB
                        DBGridPlanillas1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01Todas;
                        DBNavPlanillas1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01Todas;
                        DBtxtID_Planilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01Todas;
                        DBtxtAnnoPlanilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01Todas;
                        DBtxtNombreCentroInformantePlanilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01Todas;
                        DBtxtMunicipioPlanilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01Todas;
                        DBtxtProvinciaPlanilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01Todas;

                        //Muestro las planillas 1164-01 de todas las provincias, para todos los a�os
                        BookLogger.MostrarPlanillas1164_01Todas;

                        //Valido el estado de los botones, a partir de la cantidad de planillas
                        if (BookLogger.CantidadPlanillas1164_01Todas = 0)
                          then
                            begin
                              //Deshabilito los botones y submenus
                              btnModificarPlanilla1164_01.Enabled:= False;
                              btnEliminarPlanilla1164_01.Enabled:= False;
                              btnExportarPlanillaHaciaFichero.Enabled:= False;

                              SubMenuModificarPlanilla1164_01.Enabled:= False;
                              SubMenuEliminarPlanilla1164_01.Enabled:= False;
                              SubMenuExportarPlanilla1164_01HaciaFichero.Enabled:= False;
                            end
                              else
                                begin
                                  //Habilito los botones y submenus
                                  btnModificarPlanilla1164_01.Enabled:= True;
                                  btnEliminarPlanilla1164_01.Enabled:= True;
                                  btnExportarPlanillaHaciaFichero.Enabled:= True;

                                  SubMenuModificarPlanilla1164_01.Enabled:= True;
                                  SubMenuEliminarPlanilla1164_01.Enabled:= True;
                                  SubMenuExportarPlanilla1164_01HaciaFichero.Enabled:= True;
                                end;

                        //Muestro la cantidad de planillas, de acuerdo al filtrado escogido
                        if (BookLogger.CantidadPlanillas1164_01Todas = 1)
                          then
                            begin
                              //Muestro la cantidad de planillas que existen creadas en la BD
                              lblCantidadPlanillas1164_01.Caption:= 'TOTAL = 1 Planilla' ;
                            end
                              else
                                begin
                                  //Muestro la cantidad de planillas que existen creadas en la BD
                                  lblCantidadPlanillas1164_01.Caption:= 'TOTAL = ' + IntToStr(BookLogger.CantidadPlanillas1164_01Todas) + ' Planillas' ;
                                end;
                      end;
            end
              else
                begin //De una provincia en espec�fico
                  //Valido en dependencia del a�o escogido
                  if (ckbxFiltrarPlanillas1164_01PorAnno.Checked = True)
                    then
                      begin //Una provincia en espec�fico, para un a�o en espec�fico
                        //Cambio los DatSource de los componentes DB
                        DBGridPlanillas1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorProvinciaYAnno;
                        DBNavPlanillas1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorProvinciaYAnno;
                        DBtxtID_Planilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorProvinciaYAnno;
                        DBtxtAnnoPlanilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorProvinciaYAnno;
                        DBtxtNombreCentroInformantePlanilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorProvinciaYAnno;
                        DBtxtMunicipioPlanilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorProvinciaYAnno;
                        DBtxtProvinciaPlanilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorProvinciaYAnno;

                        //Muestro las planillas 1164-01 de una provincia en espec�fico, para un a�o en espec�fico
                        BookLogger.MostrarPlanillas1164_01PorProvinciaYAnno(Provincia, Anno);

                        //Valido el estado de los botones, a partir de la cantidad de planillas
                        if (BookLogger.CantidadPlanillas1164_01PorProvinciaYAnno = 0)
                          then
                            begin
                              //Deshabilito los botones y submenus
                              btnModificarPlanilla1164_01.Enabled:= False;
                              btnEliminarPlanilla1164_01.Enabled:= False;
                              btnExportarPlanillaHaciaFichero.Enabled:= False;

                              SubMenuModificarPlanilla1164_01.Enabled:= False;
                              SubMenuEliminarPlanilla1164_01.Enabled:= False;
                              SubMenuExportarPlanilla1164_01HaciaFichero.Enabled:= False;
                            end
                              else
                                begin
                                  //Habilito los botones y submenus
                                  btnModificarPlanilla1164_01.Enabled:= True;
                                  btnEliminarPlanilla1164_01.Enabled:= True;
                                  btnExportarPlanillaHaciaFichero.Enabled:= True;

                                  SubMenuModificarPlanilla1164_01.Enabled:= True;
                                  SubMenuEliminarPlanilla1164_01.Enabled:= True;
                                  SubMenuExportarPlanilla1164_01HaciaFichero.Enabled:= True;
                                end;
                                                        
                        //Muestro la cantidad de planillas, de acuerdo al filtrado escogido
                        if (BookLogger.CantidadPlanillas1164_01PorProvinciaYAnno = 1)
                          then
                            begin
                              //Muestro la cantidad de planillas que existen creadas en la BD
                              lblCantidadPlanillas1164_01.Caption:= 'TOTAL = 1 Planilla' ;
                            end
                              else
                                begin
                                  //Muestro la cantidad de planillas que existen creadas en la BD
                                  lblCantidadPlanillas1164_01.Caption:= 'TOTAL = ' + IntToStr(BookLogger.CantidadPlanillas1164_01PorProvinciaYAnno) + ' Planillas' ;
                                end;
                      end
                        else
                          begin //Una provincia en espec�fico, para todos los a�os
                            //Cambio los DatSource de los componentes DB
                            DBGridPlanillas1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorProvincia;
                            DBNavPlanillas1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorProvincia;
                            DBtxtID_Planilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorProvincia;
                            DBtxtAnnoPlanilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorProvincia;
                            DBtxtNombreCentroInformantePlanilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorProvincia;
                            DBtxtMunicipioPlanilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorProvincia;
                            DBtxtProvinciaPlanilla1164_01.DataSource:= DataModuleInformes.dsSelecPlanillas1164_01PorProvincia;

                            //Muestro las planillas 1164-01 de una provincia en espec�fico, para todos los a�os
                            BookLogger.MostrarPlanillas1164_01PorProvincia(Provincia);

                            //Valido el estado de los botones, a partir de la cantidad de planillas
                            if (BookLogger.CantidadPlanillas1164_01PorProvincia = 0)
                              then
                                begin
                                  //Deshabilito los botones y submenus
                                  btnModificarPlanilla1164_01.Enabled:= False;
                                  btnEliminarPlanilla1164_01.Enabled:= False;
                                  btnExportarPlanillaHaciaFichero.Enabled:= False;

                                  SubMenuModificarPlanilla1164_01.Enabled:= False;
                                  SubMenuEliminarPlanilla1164_01.Enabled:= False;
                                  SubMenuExportarPlanilla1164_01HaciaFichero.Enabled:= False;
                                end
                                  else
                                    begin
                                      //Habilito los botones y submenus
                                      btnModificarPlanilla1164_01.Enabled:= True;
                                      btnEliminarPlanilla1164_01.Enabled:= True;
                                      btnExportarPlanillaHaciaFichero.Enabled:= True;

                                      SubMenuModificarPlanilla1164_01.Enabled:= True;
                                      SubMenuEliminarPlanilla1164_01.Enabled:= True;
                                      SubMenuExportarPlanilla1164_01HaciaFichero.Enabled:= True;
                                    end;

                            //Muestro la cantidad de planillas, de acuerdo al filtrado escogido
                            if (BookLogger.CantidadPlanillas1164_01PorProvincia = 1)
                              then
                                begin
                                  //Muestro la cantidad de planillas que existen creadas en la BD
                                  lblCantidadPlanillas1164_01.Caption:= 'TOTAL = 1 Planilla' ;
                                end
                                  else
                                    begin
                                      //Muestro la cantidad de planillas que existen creadas en la BD
                                      lblCantidadPlanillas1164_01.Caption:= 'TOTAL = ' + IntToStr(BookLogger.CantidadPlanillas1164_01PorProvincia) + ' Planillas' ;
                                    end;
                          end;
                end;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.AgregarInformeMES1164;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Le cambio el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        frmPrincipal.Caption:= 'BookLogger, Informes al M.E.S. - Modelo 1164-01. Agregando una nueva Planilla 1164-01';

        //Estipulo la provincia inicial de la forma
        if (cmbxFiltrarPlanillas1164_01PorProvincia.Text = 'TODAS')
          then
            begin
              //Lo pongo en Ciudad de La Habana de inicio
              frmNuevaPlanilla1164_01.cmbxProvincia.ItemIndex:= 3;
            end
              else
                begin
                  //Lo pongo inicialmente en la misma provincia que en la forma principal
                  frmNuevaPlanilla1164_01.cmbxProvincia.ItemIndex:= ( cmbxFiltrarPlanillas1164_01PorProvincia.ItemIndex - 1 );
                end;

        //Muestro la forma de entrada de Planilla 1164-01
        frmNuevaPlanilla1164_01.Position:= poScreenCenter;
        frmNuevaPlanilla1164_01.ShowModal;

        //Actualizo el DBGrid de Planillas 1164-01
        ActualizarInformesMES1164;

        //Le restituyo el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        frmPrincipal.Caption:= 'BookLogger - Sistema de Control Docente Automatizado';
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.EliminarInformeMES1164;
var
  Provincia, Municipio, NombreCentro: AnsiString;

  ID_Planilla, Anno: Integer;

label Ejecutar, Salida;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //** Recojo la provincia **
        Provincia:= cmbxFiltrarPlanillas1164_01PorProvincia.Text;

        //Valido en dependencia de la provincia escogida
        if (Provincia = 'TODAS')
          then
            begin //De todas las provincias
              //Valido en dependencia del a�o escogido
              if (ckbxFiltrarPlanillas1164_01PorAnno.Checked = True)
                then
                  begin //Todas las provincias, para un a�o en espec�fico
                    //Valido si puedo ejecutar el procedimiento, a partir de la cantidad de planillas
                    if (BookLogger.CantidadPlanillas1164_01PorAnno = 0)
                      then
                        begin
                          //Salgo del procedimiento
                          goto Salida;
                        end
                          else
                            begin
                              //Ejecuto el procedimiento
                              goto Ejecutar;
                            end;
                  end
                    else
                      begin //Todas las provincias, para todos los a�os
                        //Valido si puedo ejecutar el procedimiento, a partir de la cantidad de planillas
                        if (BookLogger.CantidadPlanillas1164_01Todas = 0)
                          then
                            begin
                              //Salgo del procedimiento
                              goto Salida;
                            end
                              else
                                begin
                                  //Ejecuto el procedimiento
                                  goto Ejecutar;
                                end;
                      end;
            end
              else
                begin //De una provincia en espec�fico
                  //Valido en dependencia del a�o escogido
                  if (ckbxFiltrarPlanillas1164_01PorAnno.Checked = True)
                    then
                      begin //Una provincia en espec�fico, para un a�o en espec�fico
                        //Valido si puedo ejecutar el procedimiento, a partir de la cantidad de planillas
                        if (BookLogger.CantidadPlanillas1164_01PorProvinciaYAnno = 0)
                          then
                            begin
                              //Salgo del procedimiento
                              goto Salida;
                            end
                              else
                                begin
                                  //Ejecuto el procedimiento
                                  goto Ejecutar;
                                end;
                      end
                        else
                          begin //Una provincia en espec�fico, para todos los a�os
                            //Valido si puedo ejecutar el procedimiento, a partir de la cantidad de planillas
                            if (BookLogger.CantidadPlanillas1164_01PorProvincia = 0)
                              then
                                begin
                                  //Salgo del procedimiento
                                  goto Salida;
                                end
                                  else
                                    begin
                                      //Ejecuto el procedimiento
                                      goto Ejecutar;
                                    end;
                          end;
                end;

        //Label de Ejecucion, cuando todo est� OK
        Ejecutar:

        //Le cambio el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        frmPrincipal.Caption:= 'BookLogger, Informes al M.E.S. - Modelo 1164-01. Eliminando una Planilla 1164-01';

        //Recojo el ID_Planilla
        ID_Planilla:= StrToInt(DBtxtID_Planilla1164_01.Field.Text);

        //Recojo el a�o
        Anno:= StrToInt(DBtxtAnnoPlanilla1164_01.Field.Text);

        //Recojo el nombre del centro informante
        NombreCentro:= DBtxtNombreCentroInformantePlanilla1164_01.Field.Text;

        //Recojo el municipio
        Municipio:= DBtxtMunicipioPlanilla1164_01.Field.Text;

        //Muestro mensaje al usuario una confirmaci�n de borrado
        if MessageDlg('�Desea eliminar la planilla perteneciente al centro ' + NombreCentro + #13 + 'del municipio ' + Municipio + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
          then
            begin
              //Realizo el borrado de la planilla 1164-01 en la BD
              BookLogger.EliminarPlanilla1164_01PorID_Planilla(ID_Planilla);

              //Actualizo el DBGrid de las planillas 1164-01
              ActualizarInformesMES1164;

              //Inserto la Traza
              BookLogger.GuardarTrazaDelSistema('Elimin� la planilla 1164-01 del a�o ' + IntToStr(Anno) + ', perteneciente al centro ' + NombreCentro + ' del municipio ' + Municipio + ', provincia ' + Provincia + '.');

              //Actualizo todas las trazas
              BookLogger.MostrarTodasLasTrazas;

              //Muestro mensaje de informaci�n del borrado ya realizado
              MessageDlg('La planilla perteneciente al centro ' + NombreCentro + #13 + 'del municipio ' + Municipio + ', ha sido eliminada.', mtInformation, [mbOk], 0);  //, mbOk
            end;
            
        //Le restituyo el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        frmPrincipal.Caption:= 'BookLogger - Sistema de Control Docente Automatizado';
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;

  //Label de Salida, cuando algo est� mal
  Salida:
end;



procedure TfrmPrincipal.btnNuevaPlanilla1164_01Click(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Agrego una nueva Planilla 1164-01
        AgregarInformeMES1164;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.ActualizarFiltroPorAnno;
begin
  //Verifico si esta marcado la opciion de filtrado por a�o
  if (ckbxFiltrarPlanillas1164_01PorAnno.Checked = True)
    then
      begin
        dtpAnno.Visible:= True;
      end
        else
          begin
            dtpAnno.Visible:= False;
          end;
end;



procedure TfrmPrincipal.ckbxFiltrarPlanillas1164_01PorAnnoClick(Sender: TObject);
begin
  //Actualizo el filtro por a�o
  ActualizarFiltroPorAnno;

  //Actualizo las Planillas 1164-01
  ActualizarInformesMES1164;  
end;



procedure TfrmPrincipal.btnEliminarPlanilla1164_01Click(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Elimino la Planilla 1164-01 seleccionada
        EliminarInformeMES1164;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.cmbxFiltrarPlanillas1164_01PorProvinciaChange(Sender: TObject);
begin
  //Actualizo las Planillas 1164-01
  ActualizarInformesMES1164;
end;



procedure TfrmPrincipal.dtpAnnoChange(Sender: TObject);
begin
  //Actualizo las Planillas 1164-01
  ActualizarInformesMES1164;
end;



procedure TfrmPrincipal.btnModificarPlanilla1164_01Click(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Modifico la Planilla 1164-01 seleccionada
        ModificarInformeMES1164;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.DBGridPlanillas1164_01DblClick(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Modifico la Planilla 1164-01 seleccionada
        ModificarInformeMES1164;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.ExportarPlanilla1164_01HaciaFichero;
var
  anno, ID_Planilla: Integer;
  mes, dia, ano :Word;
  Provincia: AnsiString;
  TempPlanilla: TPlanilla1164_01;

   //Sistema Aravil CAB Component
   aCabWr: TSTCabWriter;

label Ejecutar, Salida;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //** Recojo la provincia **
        Provincia:= cmbxFiltrarPlanillas1164_01PorProvincia.Text;

        //Valido en dependencia de la provincia escogida
        if (Provincia = 'TODAS')
          then
            begin //De todas las provincias
              //Valido en dependencia del a�o escogido
              if (ckbxFiltrarPlanillas1164_01PorAnno.Checked = True)
                then
                  begin //Todas las provincias, para un a�o en espec�fico
                    //Valido si puedo ejecutar el procedimiento, a partir de la cantidad de planillas
                    if (BookLogger.CantidadPlanillas1164_01PorAnno = 0)
                      then
                        begin
                          //Salgo del procedimiento
                          goto Salida;
                        end
                          else
                            begin
                              //Ejecuto el procedimiento
                              goto Ejecutar;
                            end;
                  end
                    else
                      begin //Todas las provincias, para todos los a�os
                        //Valido si puedo ejecutar el procedimiento, a partir de la cantidad de planillas
                        if (BookLogger.CantidadPlanillas1164_01Todas = 0)
                          then
                            begin
                              //Salgo del procedimiento
                              goto Salida;
                            end
                              else
                                begin
                                  //Ejecuto el procedimiento
                                  goto Ejecutar;
                                end;
                      end;
            end
              else
                begin //De una provincia en espec�fico
                  //Valido en dependencia del a�o escogido
                  if (ckbxFiltrarPlanillas1164_01PorAnno.Checked = True)
                    then
                      begin //Una provincia en espec�fico, para un a�o en espec�fico
                        //Valido si puedo ejecutar el procedimiento, a partir de la cantidad de planillas
                        if (BookLogger.CantidadPlanillas1164_01PorProvinciaYAnno = 0)
                          then
                            begin
                              //Salgo del procedimiento
                              goto Salida;
                            end
                              else
                                begin
                                  //Ejecuto el procedimiento
                                  goto Ejecutar;
                                end;
                      end
                        else
                          begin //Una provincia en espec�fico, para todos los a�os
                            //Valido si puedo ejecutar el procedimiento, a partir de la cantidad de planillas
                            if (BookLogger.CantidadPlanillas1164_01PorProvincia = 0)
                              then
                                begin
                                  //Salgo del procedimiento
                                  goto Salida;
                                end
                                  else
                                    begin
                                      //Ejecuto el procedimiento
                                      goto Ejecutar;
                                    end;
                          end;
                end;

        //Label de Ejecucion, cuando todo est� OK
        Ejecutar:

        //Le cambio el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        frmPrincipal.Caption:= 'BookLogger, Informes al M.E.S. - Modelo 1164-01. Exportando una Planilla hacia fichero';

        //Cambio el cursor (trabajando)
        Cursor := crHourGlass;

        //*** Utilizando el sistema Aravil CAB Component ***

        //Creo el componente de compresi�n
        aCabWr := TSTCabWriter.Create(nil);

        //Especifico el tipo de compresi�n
        aCabWr.CompressionType := cctMsZip;

        //Configuro el SaveDialog
        //SaveDialog.FileName:= '';
        SaveDialog.Filter:= 'Archivos de Planillas 1164-01 (*.P01)|*.P01';
        SaveDialog.DefaultExt := '*.P01';
        
        //Ejecuto el dialogo de salva
        if (SaveDialog.Execute)
        then
          begin //Dialogo de salva
            //Recojo el ID_Planilla de la planilla 1164-01 seleccionada
            ID_Planilla:= StrToInt(DBtxtID_Planilla1164_01.Field.Text);

            //Busco los valores de la planilla seleccionada, en la BD
            BookLogger.BuscarPlanilla1164_01PorID_Planilla(ID_Planilla);

            //Reposiciono los componentes no directos
            ReposicionarComponentesNoDirectos;

            //Creo una planilla 1164-01 temporal
            TempPlanilla:= TPlanilla1164_01.Create;

            //Relleno la planilla 1164-01 temporal
            RellenarPlanillaTemporal(TempPlanilla);

            //Le especifico el lugar y nombre del fichero *.p01 a salvar (Sistema Aravil CAB Component)
            aCabWr.Open(SaveDialog.FileName);

            //Creo un fichero de planilla 1164-01
            FicheroPlanilla1164_01:= TFicheroPlanilla1164_01.New;

            //Cargo un fichero de valores planilla 1164-01 desde los temporales de la libreria, para que no siga dando error (out of bounds, en un sistema anterior - SimOptic 2008)
            FicheroPlanilla1164_01.CargarValoresDePlanilla1164_01ExtraidaDesdeFichero(ExtractFilePath(Application.ExeName) +  'Library\TempFiles\Planilla1164_01.txt');

            //Relleno el fichero con los valores de la planilla 1164-01
            FicheroPlanilla1164_01.SetValoresDePlanilla1164_01ExtraidaDesdeFichero(TempPlanilla);

            //Salvo el fichero en archivos temporales de la libreria
            FicheroPlanilla1164_01.SalvarValoresDePlanilla1164_01ExtraidaDesdeFichero(ExtractFilePath(Application.ExeName) + 'Library\TempFiles\Planilla1164_01.txt');

            //Libero el archivo de planilla 1164-01
            FicheroPlanilla1164_01.Free;

            //Le agrego los valores de la planilla 1164-01, guardada en archivos temporales de la libreria, al archivo P01 (Sistema Aravil CAB Component)
            aCabWr.AddFile(ExtractFilePath(Application.ExeName) + 'Library\TempFiles\Planilla1164_01.txt', 'Planilla1164_01.txt');

            //Cierro el fichero comprimido (Sistema Aravil CAB Component)
            aCabWr.Close;

            //Libero el componente de compresi�n (Sistema Aravil CAB Component)
            aCabWr.Free;
          end;  //Fin de dialogo de salva

        {
        //Si salv� hacia la Biblioteca Interna
        if (   ExtractFilePath(SaveDialog.FileName) = (ExtractFilePath(Application.ExeName) + 'Library\')   )
        then
          begin
            //Actualizo el FileListBox
            FileListBoxSimulacionImagenes.Update;
          end;
        }

        //Pongo el cursor normal
        Cursor := crDefault;

        //Le restituyo el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        frmPrincipal.Caption:= 'BookLogger - Sistema de Control Docente Automatizado';
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;

  //Label de Salida, cuando algo est� mal
  Salida:
end;



procedure TfrmPrincipal.ImportarPlanilla1164_01DesdeFichero;
var
  ArchivoEnteroAbierto: AnsiString;
  CaminoDelArchivoAbierto: AnsiString;
  NombreEnteroDelArchivoAbierto: AnsiString;
  NombreDelArchivoAbierto: AnsiString;

  ExtensionDelArchivoAbierto: AnsiString;
  NombreUtilDelArchivoAbierto: AnsiString;

  TempPlanilla: TPlanilla1164_01;
  Label Salida;
begin
  //Le especifico el filter al OpenDialog
  OpenDialog.FileName:= '';
  OpenDialog.Filter:= 'Archivos de Planillas 1164-01 (*.P01)|*.P01';
  OpenDialog.DefaultExt := '*.P01';

  //Ejecuto el OpenDialog
  if (OpenDialog.Execute)
    then
      begin
        //Copio la direccion entera al archivo abierto
        ArchivoEnteroAbierto:= OpenDialog.FileName;

        //Le extraigo el camino de acceso al archivo abierto
        CaminoDelArchivoAbierto:= ExtractFilePath(ArchivoEnteroAbierto);

        //Obtengo el nombre entero del archivo abierto (junto con la extension)
        NombreEnteroDelArchivoAbierto:= QuitaEn(ArchivoEnteroAbierto, CaminoDelArchivoAbierto);

        //Obtengo el nombre del archivo abierto (sin la extensi�n)
        NombreDelArchivoAbierto:=  QuitaEn(NombreEnteroDelArchivoAbierto, AnsiRightStr(NombreEnteroDelArchivoAbierto, 3 + 1));

        //*** Verificamos si el archivo abierto es de extension *.p01 (Planilla 1164-01)
        if (  LowerCase( AnsiRightStr(NombreEnteroDelArchivoAbierto, 3) ) = 'p01'   )
          then
            begin //Formato *.P01 (Planilla 1164-01)
              //Obtengo la extension del archivo abierto
              ExtensionDelArchivoAbierto:= 'p01';

              //En este caso la parte util coincide con el nombre
              NombreUtilDelArchivoAbierto:= NombreDelArchivoAbierto;
                    
              //Procedemos a copiar el fichero hacia los archivos temporales de la biblioteca
              ExtraerFicheroP01(ArchivoEnteroAbierto);

              //Verifico el formato del archivo interior (si est�)
              if (   FileExists(   LowerCase(ExtractFilePath(Application.ExeName) +  'Library\TempFiles\Planilla1164_01.txt')   ) = True   )
                then
                  begin  //Formato txt de los valores interiores
                    //Creo un fichero de Planilla 1164-01
                    FicheroPlanilla1164_01:= TFicheroPlanilla1164_01.New;

                    //Cargo el fichero de la planilla 1164-01
                    FicheroPlanilla1164_01.CargarValoresDePlanilla1164_01ExtraidaDesdeFichero(ExtractFilePath(Application.ExeName) +  'Library\TempFiles\Planilla1164_01.txt');

                    //Verifico que no haya lios con los valores
                    if (FicheroPlanilla1164_01.ElFicheroEstaEnBuenEstado = True)
                      then
                        begin //Todo ok con los valores de la planilla 1164-01
                          //Creo una planilla 1164-01 temporal
                          TempPlanilla:= TPlanilla1164_01.Create;

                          //Determino los valores de la planilla 1164-01 a partir del fichero, y lo guardo en la planilla temporal
                          FicheroPlanilla1164_01.DeterminarValoresDePlanilla1164_01ExtraidaDesdeFichero(TempPlanilla);

                          //Busco una planilla con el mismo posicionamiento, para ver si ya existe
                          BookLogger.BuscarPlanilla1164_01PorCodigoYAnno(TempPlanilla.CodigoCentroInformante, TempPlanilla.Anno);

                          //Valido que no exista una planilla igual en la BD
                          if (BookLogger.ExistePlanilla1164_01PorCodigoYAnno = False)
                            then
                              begin
                                //Inserto la planilla 1164-01 temporal
                                BookLogger.InsertarPlanilla1164_01(TempPlanilla);

                                //Inserto la traza
                                BookLogger.GuardarTrazaDelSistema('Agreg� una planilla 1164-01, para la provincia de ' + cmbxProvincia.Text + ', municipio ' + DBlucmbxMunicipio.Text + ', a�o ' + IntToStr(TempPlanilla.Anno) + ' y referente al centro ' + TempPlanilla.NombreCentroInformante );

                                //Actualizo todas las trazas
                                BookLogger.MostrarTodasLasTrazas;

                                //Actualizo el DBGrid de las planillas 1164-01
                                ActualizarInformesMES1164;

                                //Guardo la direccion entera al archivo abierto en la variable global
                                ArchivoEnteroAbiertoPlanilla1164_01:= ArchivoEnteroAbierto;

                                //Guardo el camino de acceso al archivo abierto en la variable global
                                CaminoDelArchivoAbiertoPlanilla1164_01:= CaminoDelArchivoAbierto;

                                //Guardo el nombre entero del archivo abierto en la variable global
                                NombreEnteroDelArchivoAbiertoPlanilla1164_01:= NombreEnteroDelArchivoAbierto;

                                //Guardo el nombre del archivo abierto (sin la extension) en la variable global
                                NombreDelArchivoAbiertoPlanilla1164_01:= NombreDelArchivoAbierto;

                                //Guardamos la extension del archivo abierto en la variable global
                                ExtensionDelArchivoAbiertoPlanilla1164_01:= 'p01';

                                //Guardo el nombre util del archivo abierto en la variable global
                                NombreUtilDelArchivoAbiertoPlanilla1164_01:= NombreUtilDelArchivoAbierto;

                                //Especifo la procedencia del fichero abierto
                                if (CaminoDelArchivoAbierto <> (ExtractFilePath(Application.ExeName) + 'Library\'))
                                  then
                                    begin
                                      ProcedenciaDelFicheroSimulacionImagenes:= 'Externo';
                                    end
                                      else
                                        begin
                                          ProcedenciaDelFicheroSimulacionImagenes:= 'Interno';
                                        end;
                              end
                                else
                                  begin
                                    MessageDlg('Ya existe una planilla con el mismo C�digo del Centro Informante,' + #13 + 'y para el mismo A�o. La planilla no puede ser insertada.', mtError, [mbOk], 0);
                                  end;

                          //Libero memoria del fichero de la planilla 1164-01
                          FicheroPlanilla1164_01.Free;
                          
                        end   //Fin de todo ok con los valores del fichero de planilla 1164-01
                          else
                            begin //Lios con los valores de la planilla 1164-01
                              //El archivo interno de valores est� da�ado o no es valido
                              MessageDlg('El archivo abierto ' + NombreDelArchivoAbierto + '.p01' + ' tiene datos internos NO ADECUADOS, o est�n da�ados.', mtError, [mbOK], 0);

                              //Salgo del procedimiento
                              Goto Salida;
                            end;  //Fin de lios con el aumento a partir del fichero interior de aumento
                  end; //Fin de formato *.txt de los valores interiores
            end;   //Fin de formato *.P01 de fichero abierto
      end; //Fin de OpenDialog ejecutado

  //Etiqueta que marca un punto de salida del procedimiento
  Salida:
end;



procedure TfrmPrincipal.btnImportarPlanillaDesdeFicheroClick(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Importo la Planilla 1164-01 desde un fichero
        ImportarPlanilla1164_01DesdeFichero;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.btnExportarPlanillaHaciaFicheroClick(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Exporto la Planilla 1164-01 hacia un fichero
        ExportarPlanilla1164_01HaciaFichero;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.MostrarBalanceAnualDePlanillas1164_01;
var
  anno: Integer;
  mes, dia, ano :Word;
  Provincia: AnsiString;

//label Ejecutar, Salida;
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //** Recojo la provincia **
        Provincia:= cmbxFiltrarPlanillas1164_01PorProvincia.Text;
{
        //Valido en dependencia de la provincia escogida
        if (Provincia = 'TODAS')
          then
            begin //De todas las provincias
              //Valido en dependencia del a�o escogido
              if (ckbxFiltrarPlanillas1164_01PorAnno.Checked = True)
                then
                  begin //Todas las provincias, para un a�o en espec�fico
                    //Valido si puedo ejecutar el procedimiento, a partir de la cantidad de planillas
                    if (BookLogger.CantidadPlanillas1164_01PorAnno = 0)
                      then
                        begin
                          //Salgo del procedimiento
                          goto Salida;
                        end
                          else
                            begin
                              //Ejecuto el procedimiento
                              goto Ejecutar;
                            end;
                  end
                    else
                      begin //Todas las provincias, para todos los a�os
                        //Valido si puedo ejecutar el procedimiento, a partir de la cantidad de planillas
                        if (BookLogger.CantidadPlanillas1164_01Todas = 0)
                          then
                            begin
                              //Salgo del procedimiento
                              goto Salida;
                            end
                              else
                                begin
                                  //Ejecuto el procedimiento
                                  goto Ejecutar;
                                end;
                      end;
            end
              else
                begin //De una provincia en espec�fico
                  //Valido en dependencia del a�o escogido
                  if (ckbxFiltrarPlanillas1164_01PorAnno.Checked = True)
                    then
                      begin //Una provincia en espec�fico, para un a�o en espec�fico
                        //Valido si puedo ejecutar el procedimiento, a partir de la cantidad de planillas
                        if (BookLogger.CantidadPlanillas1164_01PorProvinciaYAnno = 0)
                          then
                            begin
                              //Salgo del procedimiento
                              goto Salida;
                            end
                              else
                                begin
                                  //Ejecuto el procedimiento
                                  goto Ejecutar;
                                end;
                      end
                        else
                          begin //Una provincia en espec�fico, para todos los a�os
                            //Valido si puedo ejecutar el procedimiento, a partir de la cantidad de planillas
                            if (BookLogger.CantidadPlanillas1164_01PorProvincia = 0)
                              then
                                begin
                                  //Salgo del procedimiento
                                  goto Salida;
                                end
                                  else
                                    begin
                                      //Ejecuto el procedimiento
                                      goto Ejecutar;
                                    end;
                          end;
                end;

        //Label de Ejecucion, cuando todo est� OK
        Ejecutar:
}
        //Le cambio el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        frmPrincipal.Caption:= 'BookLogger, Informes al M.E.S. - Modelo 1164-01. Mostrando el Balance Anual de Planillas';

        //Intento convertir la cadena hacia un n�mero entero
        anno:= StrToIntDef(   AnsiRightStr(DateToStr(dtpAnno.Date), 4 ), 0   );

        //Verifico si tom� el valor default = 0 (no es entero)
        if (anno = 0)
          then
            begin
              //Decodifico el DateTimePicker en porciones de fecha
              DecodeDate(dtpAnno.Date, ano, mes, dia);

              //Tomo lo que me interesa (el a�o)
              anno:= ano;
            end;

        //Le anvio el a�o hacia la forma de Balance Anual de Planillas 1164-01
        frmSumatoriaPlanillas1164_01PorAnno.FAnno:= anno;

        //Muestro la forma de Balance Anual de Planillas 1164-01
        frmSumatoriaPlanillas1164_01PorAnno.Position:= poScreenCenter;
        frmSumatoriaPlanillas1164_01PorAnno.ShowModal;

        //Le restituyo el Caption al sistema, por una cuesti�n informativa y de apariencia tambi�n.
        frmPrincipal.Caption:= 'BookLogger - Sistema de Control Docente Automatizado';
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;

  //Label de Salida, cuando algo est� mal
  //Salida:
end;



procedure TfrmPrincipal.btnBalanceAnualPlanillas1164_01Click(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Muestro el balance Anual de las Planillas 1164-01
        MostrarBalanceAnualDePlanillas1164_01;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuAgregarPlanilla1164_01Click(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Agrego una nueva Planilla 1164-01
        AgregarInformeMES1164;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;




procedure TfrmPrincipal.SubMenuModificarPlanilla1164_01Click(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Modifico la Planilla 1164-01 seleccionada
        ModificarInformeMES1164;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;




procedure TfrmPrincipal.SubMenuEliminarPlanilla1164_01Click(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Elimino la Planilla 1164-01 seleccionada
        EliminarInformeMES1164;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuVerBalanceAnualDePlanillas1164_01Click(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Muestro el balance Anual de las Planillas 1164-01
        MostrarBalanceAnualDePlanillas1164_01;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuImportarPlanilla1164_01DesdeFicheroClick(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Importo la Planilla 1164-01 desde un fichero
        ImportarPlanilla1164_01DesdeFichero;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuExportarPlanilla1164_01HaciaFicheroClick(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Exporto la Planilla 1164-01 hacia un fichero
        ExportarPlanilla1164_01HaciaFichero;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.btnPrevisualizarReportePlanillas1164_01Click(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Previsualizo el Reporte de Planillas 1164-01
        PrevisualizarReporteInformeMES1164;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuVerReportePlanillas1164_01Click(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Previsualizo el Reporte de Planillas 1164-01
        PrevisualizarReporteInformeMES1164;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.btnExportarHaciaPDFReportePlanillas1164_01Click(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Exporto hacia PDF el Reporte de Planillas 1164-01
        ExportarHaciaPDFReporteInformeMES1164;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuExportarReportePlanillas1164_01Click(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Exporto hacia PDF el Reporte de Planillas 1164-01
        ExportarHaciaPDFReporteInformeMES1164;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.SubMenuImprimirReportePlanillas1164_01Click(Sender: TObject);
begin
  //Ante todo verifico si aun hay conexion con la BD
  if (BookLogger.ExisteConexionConLaBD = True)
    then
      begin
        //Imprimo el Reporte de Planillas 1164-01
        ImprimirReporteInformeMES1164;
      end
        else
          begin
            MessageDlg('Se ha perdido la conexi�n con la base de datos.' + #13 + 'Int�ntelo en otra ocasi�n', mtError, [mbOk], 0);
          end;
end;



procedure TfrmPrincipal.ExtraerFicheroP01(aPath: AnsiString);
var
   aCabRd: TSTCabReader;
   //FilesExtracted: Integer;
begin
  //*** Utilizando el sistema Aravil CAB Component ***
  //Creo el componente de descompresi�n
  aCabRd := TSTCabReader.Create(nil);

  //Extraigo si existe el directorio de extraccion
  if DirectoryExists(ExtractFilePath(Application.ExeName) + 'Library\TempFiles\')   // if the directory exists then extract
    Then
      begin
        //FilesExtracted := UnCabSimulacionImagenes.Extract();
        //ShowMessage('Archivos extraidos: ' + IntToStr(FilesExtracted));

        //Borro el archivo de valores de planilla 1164-01 que ya estaba all� (daba bateos con info mostrada en Memo, en SimOptic 2008,... un sistema anterior)
        DeleteFile(ExtractFilePath(Application.ExeName) + 'Library\TempFiles\Planilla1164_01.txt');

        //Le paso el nombre del archivo a descompactar y extraigo (Sistema Aravil CAB Component)
        aCabRd.ExtractFiles(aPath, ExtractFilePath(Application.ExeName) + 'Library\TempFiles\');
      end
        else
          begin
            ShowMessage('Directorio de extracci�n no definido.');
            Exit;
          end;
end;



procedure TfrmPrincipal.ReposicionarComponentesNoDirectos;
var
  ID_Municipio: Integer;
begin
  //Reordeno los componentes no directos (provincia)
  cmbxProvincia.Text:= DBtxtProvinciaPlanilla1164_01.Field.Text;

  //Ejecuto el evento ONChange del ComboBox de provincia (esto llena el DBLookUpComboBox de los municipios)
  cmbxProvincia.OnChange(self);

  //Busco el ID_Municipio, por su Municipio
  BookLogger.BuscarID_MunicipioParaPlanilla1164_01PorNombreMunicipio(DBtxtMunicipioPlanilla1164_01.Field.Text);

  //Recojo el ID del municipio encontrado
  ID_Municipio:= StrToInt(DBtxtID_MunicipioBuscado.Field.Text);

  //Posiciono el DBLookUpComboBox de Municipios en la posicion correcta
  DBlucmbxMunicipio.KeyValue:= ID_Municipio;

  //Reordeno los componentes no directos (A�o - DateTimePicker)
  dtpAnnoPlanilla1164_01Temporal.Date:= StrToDate('21/01/' + DBtxtAnno.Field.Text);
end;



procedure TfrmPrincipal.cmbxProvinciaChange(Sender: TObject);
begin
  //Muestro los municipios de la provincia mostrada en el ComboBox
  BookLogger.MostrarMunicipiosParaPlanilla1164_01PorNombreProvincia(cmbxProvincia.Text);
end;



procedure TfrmPrincipal.RellenarPlanillaTemporal(aPlanilla: TPlanilla1164_01);
var
  anno: Integer;
  provincia: string;
  mes, dia, ano :Word;
begin
  //Intento convertir la cadena hacia un n�mero entero
  anno:= StrToIntDef(   AnsiRightStr(DateToStr(dtpAnnoPlanilla1164_01Temporal.Date), 4 ), 0   );

  //Verifico si tom� el valor default = 0 (no es entero)
  if (anno = 0)
    then
      begin
        //Decodifico el DateTimePicker en porciones de fecha
        DecodeDate(dtpAnnoPlanilla1164_01Temporal.Date, ano, mes, dia);

        //Tomo lo que me interesa (el a�o)
        anno:= ano;
      end;
      
    //Relleno la planilla 1164-01 temporal
    //Posicionamiento
    aPlanilla.Anno:=  anno;
    aPlanilla.Municipio:= DBlucmbxMunicipio.Text;
    aPlanilla.Provincia:= cmbxProvincia.Text;



    //Datos Generales
    aPlanilla.NombreCentroInformante:= DBedtNombreCentroInformante.Field.Text;
    aPlanilla.CodigoCentroInformante:= DBedtCodigoCentroInformante.Field.Text;
    aPlanilla.NombreDirectorEconomico:= DBedtNombreDirectorEconomico.Field.Text;
    aPlanilla.NombreRectorODirector:= DBedtNombreRectorODirector.Field.Text;
    //aPlanilla.FechaConfeccion:= StrToDateTime(BookLogger.ObtenerFechaDelSistema + ' ' + BookLogger.ObtenerHoraDelSistema) ;


    //Secci�n I: Caracterizaci�n
    aPlanilla.DoctoresXTotal:= StrToInt(DBedtDoctoresXTotal.Field.Text);
    aPlanilla.DoctoresXCantGrad:= StrToInt(DBedtDoctoresXCantGrad.Field.Text);
    aPlanilla.DoctoresXCantParticip:= StrToInt(DBedtDoctoresXCantParticip.Field.Text);



    //Secci�n II: Superaci�n Profesional
    //Diplomados
    aPlanilla.DiplomadosXCantActivTotal:= StrToInt(DBedtDiplomadosXCantActivTotal.Field.Text);
    aPlanilla.DiplomadosXCantActivUnivMun:= StrToInt(DBedtDiplomadosXCantActivUnivMun.Field.Text);
    aPlanilla.DiplomadosXCantActivADistancia:= StrToInt(DBedtDiplomadosXCantActivADistancia.Field.Text);
    aPlanilla.DiplomadosXCantActivExtranjero:= StrToInt(DBedtDiplomadosXCantActivExtranjero.Field.Text);
    aPlanilla.DiplomadosXCantParticipTotal:= StrToInt(DBedtDiplomadosXCantParticipTotal.Field.Text);
    aPlanilla.DiplomadosXCantParticipMujeres:= StrToInt(DBedtDiplomadosXCantParticipMujeres.Field.Text);
    aPlanilla.DiplomadosXCantParticipExtranjeros:= StrToInt(DBedtDiplomadosXCantParticipExtranjeros.Field.Text);
    aPlanilla.DiplomadosXCantParticipProfTC:= StrToInt(DBedtDiplomadosXCantParticipProfTC.Field.Text);
    aPlanilla.DiplomadosXCantParticipProfTP:= StrToInt(DBedtDiplomadosXCantParticipProfTP.Field.Text);
    aPlanilla.DiplomadosXCantParticipUnivMun:= StrToInt(DBedtDiplomadosXCantParticipUnivMun.Field.Text);
    aPlanilla.DiplomadosXCantParticipADistancia:= StrToInt(DBedtDiplomadosXCantParticipADistancia.Field.Text);
    aPlanilla.DiplomadosXCantGradTotal:= StrToInt(DBedtDiplomadosXCantGradTotal.Field.Text);
    aPlanilla.DiplomadosXCantGradMujeres:= StrToInt(DBedtDiplomadosXCantGradMujeres.Field.Text);
    aPlanilla.DiplomadosXCantGradExtranjeros:= StrToInt(DBedtDiplomadosXCantGradExtranjeros.Field.Text);
    aPlanilla.DiplomadosXCantGradProfTC:= StrToInt(DBedtDiplomadosXCantGradProfTC.Field.Text);
    aPlanilla.DiplomadosXCantGradProfTP:= StrToInt(DBedtDiplomadosXCantGradProfTP.Field.Text);

    //Entrenamientos
    aPlanilla.EntrenamientosXCantActivTotal:= StrToInt(DBedtEntrenamientosXCantActivTotal.Field.Text);
    aPlanilla.EntrenamientosXCantActivUnivMun:= StrToInt(DBedtEntrenamientosXCantActivUnivMun.Field.Text);
    aPlanilla.EntrenamientosXCantActivADistancia:= StrToInt(DBedtEntrenamientosXCantActivADistancia.Field.Text);
    aPlanilla.EntrenamientosXCantActivExtranjero:= StrToInt(DBedtEntrenamientosXCantActivExtranjero.Field.Text);
    aPlanilla.EntrenamientosXCantParticipTotal:= StrToInt(DBedtEntrenamientosXCantParticipTotal.Field.Text);
    aPlanilla.EntrenamientosXCantParticipMujeres:= StrToInt(DBedtEntrenamientosXCantParticipMujeres.Field.Text);
    aPlanilla.EntrenamientosXCantParticipExtranjeros:= StrToInt(DBedtEntrenamientosXCantParticipExtranjeros.Field.Text);
    aPlanilla.EntrenamientosXCantParticipProfTC:= StrToInt(DBedtEntrenamientosXCantParticipProfTC.Field.Text);
    aPlanilla.EntrenamientosXCantParticipProfTP:= StrToInt(DBedtEntrenamientosXCantParticipProfTP.Field.Text);
    aPlanilla.EntrenamientosXCantParticipUnivMun:= StrToInt(DBedtEntrenamientosXCantParticipUnivMun.Field.Text);
    aPlanilla.EntrenamientosXCantParticipADistancia:= StrToInt(DBedtEntrenamientosXCantParticipADistancia.Field.Text);
    aPlanilla.EntrenamientosXCantGradTotal:= StrToInt(DBedtEntrenamientosXCantGradTotal.Field.Text);
    aPlanilla.EntrenamientosXCantGradMujeres:= StrToInt(DBedtEntrenamientosXCantGradMujeres.Field.Text);
    aPlanilla.EntrenamientosXCantGradExtranjeros:= StrToInt(DBedtEntrenamientosXCantGradExtranjeros.Field.Text);
    aPlanilla.EntrenamientosXCantGradProfTC:= StrToInt(DBedtEntrenamientosXCantGradProfTC.Field.Text);
    aPlanilla.EntrenamientosXCantGradProfTP:= StrToInt(DBedtEntrenamientosXCantGradProfTP.Field.Text);

    //Cursos
    aPlanilla.CursosXCantActivTotal:= StrToInt(DBedtCursosXCantActivTotal.Field.Text);
    aPlanilla.CursosXCantActivUnivMun:= StrToInt(DBedtCursosXCantActivUnivMun.Field.Text);
    aPlanilla.CursosXCantActivADistancia:= StrToInt(DBedtCursosXCantActivADistancia.Field.Text);
    aPlanilla.CursosXCantActivExtranjero:= StrToInt(DBedtCursosXCantActivExtranjero.Field.Text);
    aPlanilla.CursosXCantParticipTotal:= StrToInt(DBedtCursosXCantParticipTotal.Field.Text);
    aPlanilla.CursosXCantParticipMujeres:= StrToInt(DBedtCursosXCantParticipMujeres.Field.Text);
    aPlanilla.CursosXCantParticipExtranjeros:= StrToInt(DBedtCursosXCantParticipExtranjeros.Field.Text);
    aPlanilla.CursosXCantParticipProfTC:= StrToInt(DBedtCursosXCantParticipProfTC.Field.Text);
    aPlanilla.CursosXCantParticipProfTP:= StrToInt(DBedtCursosXCantParticipProfTP.Field.Text);
    aPlanilla.CursosXCantParticipUnivMun:= StrToInt(DBedtCursosXCantParticipUnivMun.Field.Text);
    aPlanilla.CursosXCantParticipADistancia:= StrToInt(DBedtCursosXCantParticipADistancia.Field.Text);
    aPlanilla.CursosXCantGradTotal:= StrToInt(DBedtCursosXCantGradTotal.Field.Text);
    aPlanilla.CursosXCantGradMujeres:= StrToInt(DBedtCursosXCantGradMujeres.Field.Text);
    aPlanilla.CursosXCantGradExtranjeros:= StrToInt(DBedtCursosXCantGradExtranjeros.Field.Text);
    aPlanilla.CursosXCantGradProfTC:= StrToInt(DBedtCursosXCantGradProfTC.Field.Text);
    aPlanilla.CursosXCantGradProfTP:= StrToInt(DBedtCursosXCantGradProfTP.Field.Text);

    //SubTotal II
    aPlanilla.SubTotal2XCantActivTotal:= StrToInt(DBedtSubTotal2XCantActivTotal.Field.Text);
    aPlanilla.SubTotal2XCantActivUnivMun:= StrToInt(DBedtSubTotal2XCantActivUnivMun.Field.Text);
    aPlanilla.SubTotal2XCantActivADistancia:= StrToInt(DBedtSubTotal2XCantActivADistancia.Field.Text);
    aPlanilla.SubTotal2XCantActivExtranjero:= StrToInt(DBedtSubTotal2XCantActivExtranjero.Field.Text);
    aPlanilla.SubTotal2XCantParticipTotal:= StrToInt(DBedtSubTotal2XCantParticipTotal.Field.Text);
    aPlanilla.SubTotal2XCantParticipMujeres:= StrToInt(DBedtSubTotal2XCantParticipMujeres.Field.Text);
    aPlanilla.SubTotal2XCantParticipExtranjeros:= StrToInt(DBedtSubTotal2XCantParticipExtranjeros.Field.Text);
    aPlanilla.SubTotal2XCantParticipProfTC:= StrToInt(DBedtSubTotal2XCantParticipProfTC.Field.Text);
    aPlanilla.SubTotal2XCantParticipProfTP:= StrToInt(DBedtSubTotal2XCantParticipProfTP.Field.Text);
    aPlanilla.SubTotal2XCantParticipUnivMun:= StrToInt(DBedtSubTotal2XCantParticipUnivMun.Field.Text);
    aPlanilla.SubTotal2XCantParticipADistancia:= StrToInt(DBedtSubTotal2XCantParticipADistancia.Field.Text);
    aPlanilla.SubTotal2XCantGradTotal:= StrToInt(DBedtSubTotal2XCantGradTotal.Field.Text);
    aPlanilla.SubTotal2XCantGradMujeres:= StrToInt(DBedtSubTotal2XCantGradMujeres.Field.Text);
    aPlanilla.SubTotal2XCantGradExtranjeros:= StrToInt(DBedtSubTotal2XCantGradExtranjeros.Field.Text);
    aPlanilla.SubTotal2XCantGradProfTC:= StrToInt(DBedtSubTotal2XCantGradProfTC.Field.Text);
    aPlanilla.SubTotal2XCantGradProfTP:= StrToInt(DBedtSubTotal2XCantGradProfTP.Field.Text);


    //Secci�n II: Postgrado Acad�mico

    //Doctorados
    aPlanilla.DoctoradosXCantActivTotal:= StrToInt(DBedtDoctoradosXCantActivTotal.Field.Text);
    aPlanilla.DoctoradosXCantActivUnivMun:= StrToInt(DBedtDoctoradosXCantActivUnivMun.Field.Text);
    aPlanilla.DoctoradosXCantActivADistancia:= StrToInt(DBedtDoctoradosXCantActivADistancia.Field.Text);
    aPlanilla.DoctoradosXCantActivExtranjero:= StrToInt(DBedtDoctoradosXCantActivExtranjero.Field.Text);
    aPlanilla.DoctoradosXCantParticipTotal:= StrToInt(DBedtDoctoradosXCantParticipTotal.Field.Text);
    aPlanilla.DoctoradosXCantParticipMujeres:= StrToInt(DBedtDoctoradosXCantParticipMujeres.Field.Text);
    aPlanilla.DoctoradosXCantParticipExtranjeros:= StrToInt(DBedtDoctoradosXCantParticipExtranjeros.Field.Text);
    aPlanilla.DoctoradosXCantParticipProfTC:= StrToInt(DBedtDoctoradosXCantParticipProfTC.Field.Text);
    aPlanilla.DoctoradosXCantParticipProfTP:= StrToInt(DBedtDoctoradosXCantParticipProfTP.Field.Text);
    aPlanilla.DoctoradosXCantParticipUnivMun:= StrToInt(DBedtDoctoradosXCantParticipUnivMun.Field.Text);
    aPlanilla.DoctoradosXCantParticipADistancia:= StrToInt(DBedtDoctoradosXCantParticipADistancia.Field.Text);
    aPlanilla.DoctoradosXCantGradTotal:= StrToInt(DBedtDoctoradosXCantGradTotal.Field.Text);
    aPlanilla.DoctoradosXCantGradMujeres:= StrToInt(DBedtDoctoradosXCantGradMujeres.Field.Text);
    aPlanilla.DoctoradosXCantGradExtranjeros:= StrToInt(DBedtDoctoradosXCantGradExtranjeros.Field.Text);
    aPlanilla.DoctoradosXCantGradProfTC:= StrToInt(DBedtDoctoradosXCantGradProfTC.Field.Text);
    aPlanilla.DoctoradosXCantGradProfTP:= StrToInt(DBedtDoctoradosXCantGradProfTP.Field.Text);

    //Especialidades
    aPlanilla.EspecialidadesXCantActivTotal:= StrToInt(DBedtEspecialidadesXCantActivTotal.Field.Text);
    aPlanilla.EspecialidadesXCantActivUnivMun:= StrToInt(DBedtEspecialidadesXCantActivUnivMun.Field.Text);
    aPlanilla.EspecialidadesXCantActivADistancia:= StrToInt(DBedtEspecialidadesXCantActivADistancia.Field.Text);
    aPlanilla.EspecialidadesXCantActivExtranjero:= StrToInt(DBedtEspecialidadesXCantActivExtranjero.Field.Text);
    aPlanilla.EspecialidadesXCantParticipTotal:= StrToInt(DBedtEspecialidadesXCantParticipTotal.Field.Text);
    aPlanilla.EspecialidadesXCantParticipMujeres:= StrToInt(DBedtEspecialidadesXCantParticipMujeres.Field.Text);
    aPlanilla.EspecialidadesXCantParticipExtranjeros:= StrToInt(DBedtEspecialidadesXCantParticipExtranjeros.Field.Text);
    aPlanilla.EspecialidadesXCantParticipProfTC:= StrToInt(DBedtEspecialidadesXCantParticipProfTC.Field.Text);
    aPlanilla.EspecialidadesXCantParticipProfTP:= StrToInt(DBedtEspecialidadesXCantParticipProfTP.Field.Text);
    aPlanilla.EspecialidadesXCantParticipUnivMun:= StrToInt(DBedtEspecialidadesXCantParticipUnivMun.Field.Text);
    aPlanilla.EspecialidadesXCantParticipADistancia:= StrToInt(DBedtEspecialidadesXCantParticipADistancia.Field.Text);
    aPlanilla.EspecialidadesXCantGradTotal:= StrToInt(DBedtEspecialidadesXCantGradTotal.Field.Text);
    aPlanilla.EspecialidadesXCantGradMujeres:= StrToInt(DBedtEspecialidadesXCantGradMujeres.Field.Text);
    aPlanilla.EspecialidadesXCantGradExtranjeros:= StrToInt(DBedtEspecialidadesXCantGradExtranjeros.Field.Text);
    aPlanilla.EspecialidadesXCantGradProfTC:= StrToInt(DBedtEspecialidadesXCantGradProfTC.Field.Text);
    aPlanilla.EspecialidadesXCantGradProfTP:= StrToInt(DBedtEspecialidadesXCantGradProfTP.Field.Text);

    //Maestr�as
    aPlanilla.MaestriasXCantActivTotal:= StrToInt(DBedtMaestriasXCantActivTotal.Field.Text);
    aPlanilla.MaestriasXCantActivUnivMun:= StrToInt(DBedtMaestriasXCantActivUnivMun.Field.Text);
    aPlanilla.MaestriasXCantActivADistancia:= StrToInt(DBedtMaestriasXCantActivADistancia.Field.Text);
    aPlanilla.MaestriasXCantActivExtranjero:= StrToInt(DBedtMaestriasXCantActivExtranjero.Field.Text);
    aPlanilla.MaestriasXCantParticipTotal:= StrToInt(DBedtMaestriasXCantParticipTotal.Field.Text);
    aPlanilla.MaestriasXCantParticipMujeres:= StrToInt(DBedtMaestriasXCantParticipMujeres.Field.Text);
    aPlanilla.MaestriasXCantParticipExtranjeros:= StrToInt(DBedtMaestriasXCantParticipExtranjeros.Field.Text);
    aPlanilla.MaestriasXCantParticipProfTC:= StrToInt(DBedtMaestriasXCantParticipProfTC.Field.Text);
    aPlanilla.MaestriasXCantParticipProfTP:= StrToInt(DBedtMaestriasXCantParticipProfTP.Field.Text);
    aPlanilla.MaestriasXCantParticipUnivMun:= StrToInt(DBedtMaestriasXCantParticipUnivMun.Field.Text);
    aPlanilla.MaestriasXCantParticipADistancia:= StrToInt(DBedtMaestriasXCantParticipADistancia.Field.Text);
    aPlanilla.MaestriasXCantGradTotal:= StrToInt(DBedtMaestriasXCantGradTotal.Field.Text);
    aPlanilla.MaestriasXCantGradMujeres:= StrToInt(DBedtMaestriasXCantGradMujeres.Field.Text);
    aPlanilla.MaestriasXCantGradExtranjeros:= StrToInt(DBedtMaestriasXCantGradExtranjeros.Field.Text);
    aPlanilla.MaestriasXCantGradProfTC:= StrToInt(DBedtMaestriasXCantGradProfTC.Field.Text);
    aPlanilla.MaestriasXCantGradProfTP:= StrToInt(DBedtMaestriasXCantGradProfTP.Field.Text);

    //SubTotal III
    aPlanilla.SubTotal3XCantActivTotal:= StrToInt(DBedtSubTotal3XCantActivTotal.Field.Text);
    aPlanilla.SubTotal3XCantActivUnivMun:= StrToInt(DBedtSubTotal3XCantActivUnivMun.Field.Text);
    aPlanilla.SubTotal3XCantActivADistancia:= StrToInt(DBedtSubTotal3XCantActivADistancia.Field.Text);
    aPlanilla.SubTotal3XCantActivExtranjero:= StrToInt(DBedtSubTotal3XCantActivExtranjero.Field.Text);
    aPlanilla.SubTotal3XCantParticipTotal:= StrToInt(DBedtSubTotal3XCantParticipTotal.Field.Text);
    aPlanilla.SubTotal3XCantParticipMujeres:= StrToInt(DBedtSubTotal3XCantParticipMujeres.Field.Text);
    aPlanilla.SubTotal3XCantParticipExtranjeros:= StrToInt(DBedtSubTotal3XCantParticipExtranjeros.Field.Text);
    aPlanilla.SubTotal3XCantParticipProfTC:= StrToInt(DBedtSubTotal3XCantParticipProfTC.Field.Text);
    aPlanilla.SubTotal3XCantParticipProfTP:= StrToInt(DBedtSubTotal3XCantParticipProfTP.Field.Text);
    aPlanilla.SubTotal3XCantParticipUnivMun:= StrToInt(DBedtSubTotal3XCantParticipUnivMun.Field.Text);
    aPlanilla.SubTotal3XCantParticipADistancia:= StrToInt(DBedtSubTotal3XCantParticipADistancia.Field.Text);
    aPlanilla.SubTotal3XCantGradTotal:= StrToInt(DBedtSubTotal3XCantGradTotal.Field.Text);
    aPlanilla.SubTotal3XCantGradMujeres:= StrToInt(DBedtSubTotal3XCantGradMujeres.Field.Text);
    aPlanilla.SubTotal3XCantGradExtranjeros:= StrToInt(DBedtSubTotal3XCantGradExtranjeros.Field.Text);
    aPlanilla.SubTotal3XCantGradProfTC:= StrToInt(DBedtSubTotal3XCantGradProfTC.Field.Text);
    aPlanilla.SubTotal3XCantGradProfTP:= StrToInt(DBedtSubTotal3XCantGradProfTP.Field.Text);


    //Total
    aPlanilla.TotalXCantActivTotal:= StrToInt(DBedtTotalXCantActivTotal.Field.Text);
    aPlanilla.TotalXCantActivUnivMun:= StrToInt(DBedtTotalXCantActivUnivMun.Field.Text);
    aPlanilla.TotalXCantActivADistancia:= StrToInt(DBedtTotalXCantActivADistancia.Field.Text);
    aPlanilla.TotalXCantActivExtranjero:= StrToInt(DBedtTotalXCantActivExtranjero.Field.Text);
    aPlanilla.TotalXCantParticipTotal:= StrToInt(DBedtTotalXCantParticipTotal.Field.Text);
    aPlanilla.TotalXCantParticipMujeres:= StrToInt(DBedtTotalXCantParticipMujeres.Field.Text);
    aPlanilla.TotalXCantParticipExtranjeros:= StrToInt(DBedtTotalXCantParticipExtranjeros.Field.Text);
    aPlanilla.TotalXCantParticipProfTC:= StrToInt(DBedtTotalXCantParticipProfTC.Field.Text);
    aPlanilla.TotalXCantParticipProfTP:= StrToInt(DBedtTotalXCantParticipProfTP.Field.Text);
    aPlanilla.TotalXCantParticipUnivMun:= StrToInt(DBedtTotalXCantParticipUnivMun.Field.Text);
    aPlanilla.TotalXCantParticipADistancia:= StrToInt(DBedtTotalXCantParticipADistancia.Field.Text);
    aPlanilla.TotalXCantGradTotal:= StrToInt(DBedtTotalXCantGradTotal.Field.Text);
    aPlanilla.TotalXCantGradMujeres:= StrToInt(DBedtTotalXCantGradMujeres.Field.Text);
    aPlanilla.TotalXCantGradExtranjeros:= StrToInt(DBedtTotalXCantGradExtranjeros.Field.Text);
    aPlanilla.TotalXCantGradProfTC:= StrToInt(DBedtTotalXCantGradProfTC.Field.Text);
    aPlanilla.TotalXCantGradProfTP:= StrToInt(DBedtTotalXCantGradProfTP.Field.Text);
end;



end.
