{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
unit UfrmValidacionPuestoDeTrabajo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, DB, sqlexpr, jpeg, ComCtrls,

  {Formas confeccionadas por mi.}
  //,UfrmNotificacionDeAlguienLoggeado,

  {Units confeccionadas por mi.}
  UGestionDocente, UPuestoDeTrabajo,
  UDataModuleControlDelSistema,



  UPantalla,
  XiButton,
  LbButton,
  
  //Dialogs especiales, esquemas, etc (Message Master)
  MessDlgs, XiPanel, QProgBar;

type
  TfrmValidacionPuestoDeTrabajo = class(TForm)
    DBTextPrimerApellido: TDBText;
    DBTextSegundoApellido: TDBText;
    TimerActualizacionPermanencia: TTimer;
    TimerMuestreoDeHoraActual: TTimer;
    TimerDelProgressBar: TTimer;
    lblbtnEntrar: TLbButton;
    lblbtnCancelar: TLbButton;
    XiPanelDatos: TXiPanel;
    edtServer: TEdit;
    lblServer: TLabel;
    lbledtUsuario: TLabeledEdit;
    lbledtContrasenna: TLabeledEdit;
    DBTextContrasenna: TDBText;
    ProgressBar1: TQProgressBar;
    DBTextHoraActual: TDBText;
    DBTextNombre: TDBText;
    DBTextPrivilegios: TDBText;
    ImageLogoCenSoft: TImage;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure lbledtUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure lbledtContrasennaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure TimerActualizacionPermanenciaTimer(Sender: TObject);
    procedure TimerMuestreoDeHoraActualTimer(Sender: TObject);
    procedure TimerDelProgressBarTimer(Sender: TObject);
    procedure edtServerKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    procedure LimpiarComponentes;
    
    procedure DeterminarResolucionInicial;
    function CambiarResolucion(XRes, YRes: DWord):integer;
  public
    { Public declarations }

    
  end;

var
  frmValidacionPuestoDeTrabajo: TfrmValidacionPuestoDeTrabajo;

implementation

uses UfrmNotificacionDeAlguienLoggeado;

var
    BookLogger: TGestionDocente;
    //TrabajadorLoggeado: TTrabajadorLoggeado;
    TempPuestoDeTrabajo: TPuestoDeTrabajo;
    HoraActual: String;

    Pantalla: TPantalla;
    AnchoOriginalPantalla: Integer;
    AltoOriginalPantalla: Integer;

  usuario: string;
  contrasenna: string;
  Privilegio: String;
  NombreUsuario: String;
  PrimerApellido: String;
  SegundoApellido: String;

{$R *.dfm}

procedure TfrmValidacionPuestoDeTrabajo.btnCancelarClick(Sender: TObject);
begin
  //Muestro mensaje al usuario una confirmaci�n de cancelaci�n de Loggeo
  if MessageDlg('�Desea cancelar la validaci�n en el sistema BookLogger?' + #13 + 'La aplicaci�n se cerrar�.', mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then
      begin
        //Elimino la conexi�n con la base de datos
        //HostalWare.EliminarConexionConLaBD;

        //Restituyo la resoluci�n de la pantalla
        CambiarResolucion(AnchoOriginalPantalla, AltoOriginalPantalla);

        //Cierro la aplicaci�n
        Application.Terminate;
      end
        else
          begin
            if (edtServer.Enabled = True)
              then
                begin
                  edtServer.SetFocus;;
                end;
          end;
end;

procedure TfrmValidacionPuestoDeTrabajo.btnEntrarClick(Sender: TObject);
var
  ContrasennaBD, UsuarioBD, NombreBaseDeDatos, NombreServer, Intranet: WideString;
begin
  //Cierro la aplicaci�n
//  frmValidacionPuestoDeTrabajo.Close;
  

  //Primero llenamos los campos de la conecci�n
  ContrasennaBD:= 'desfasator';
  UsuarioBD:= 'reinier';
  NombreBaseDeDatos:= 'BookLogger';
  NombreServer:= frmValidacionPuestoDeTrabajo.edtServer.Text;
  Intranet:= 'Casa';

  //Deshabilito los LabelEdits y Edit
  edtServer.Enabled:= False;
  lbledtUsuario.Enabled:= False;
  lbledtContrasenna.Enabled:= False;

  //Deshabilito el bot�n de "Entrar"
  lblbtnEntrar.Enabled:= False;

  //EDatabaseError
  
  //Primero verifico que se halla tecleado el nombre del server
  if ( (edtServer.Text<>'')   )
    then
      begin
          //Luego verifico que se haya tecleado el usuario y la contrase�a
          if (   (lbledtUsuario.Text<> '') and (lbledtContrasenna.Text<> '')   )
            then
              begin
              
                //Intento establecer la conexi�n con la BD
                try
                BookLogger.EstablecerConexionConLaBD(ContrasennaBD, UsuarioBD, NombreBaseDeDatos, NombreServer, Intranet);
                except
                on Exception do

                Exception.Create('No existe conexi�n con la base de datos');
                //ShowMessage('No existe conexi�n en estos momentos con la base de datos.' + #13 + 'Es imposible realizar la validaci�n en el sistema HC-CAP 2008.' + #13 + 'El sistema se cerrar�.');
                end;


                //Tomo el usuario y la contrase�a desde la forma
                usuario:= lbledtUsuario.Text;
                contrasenna:= lbledtContrasenna.Text;

                if (BookLogger.ExisteConexionConLaBD = True)
                  then
                    begin
                      if (BookLogger.ExisteElPuestoDeTrabajoConUsuario(usuario))
                        then
                          begin
                            //Aqu� es donde debo verificar si existe alguien loggeado en el sistema BookLogger
                            if (BookLogger.HayAlguienLoggeado = False)
                              then
                                begin
                                  BookLogger.BuscarPuestoDeTrabajo(usuario);

                                  //Verifico si la contrase�a coincide
                                  if (DBTextContrasenna.Field.Text = BookLogger.EncriptarSeudoaleatorio(contrasenna))
                                    then
                                      begin
                                        //Busco al usuario como si fuese Administrador, para luego comprobar si lo hall�
                                        BookLogger.SelecAdministrador(usuario);

                                        //Tomo los otros valores que me faltan desde la forma
                                        Privilegio:= DBTextPrivilegios.Field.Text;
                                        NombreUsuario:= DBTextNombre.Field.Text;
                                        PrimerApellido:= DBTextPrimerApellido.Field.Text;
                                        SegundoApellido:= DBTextSegundoApellido.Field.Text;

                                        //Ahora debo guardar el Loggin
                                        BookLogger.LoggearAlUsuario(usuario, Privilegio, NombreUsuario, PrimerApellido, SegundoApellido);

                                        //Se habilita el timer para la actualizaci�n de permanencia
                                        TimerActualizacionPermanencia.Enabled:= True;

                                        //Cierro la forma
                                        frmValidacionPuestoDeTrabajo.Close;
                                      end
                                        else
                                          begin
                                            //Elimino la conexi�n con la base de datos
                                            BookLogger.EliminarConexionConLaBD;

                                            ShowMessage('Acceso denegado. Contrase�a incorrecta.');

                                            //Habilito los LabelEdits y Edit
                                            edtServer.Enabled:= True;
                                            lbledtUsuario.Enabled:= True;
                                            lbledtContrasenna.Enabled:= True;

                                            //Habilito los botones de "Entrar" y "Cancelar"
                                            lblbtnEntrar.Enabled:= True;
                                            lblbtnCancelar.Enabled:= True;

                                            //Borro lo tecleado en el Edit de l contrase�a
                                            lbledtContrasenna.Clear;

                                            //Me paro en la contrase�a
                                            lbledtContrasenna.SetFocus;
                                          end;
                                end //Fin de no hay nadie loggeado
                                  else
                                    begin // Hay alguien supuestamente loggeado. Debo verificar si aun lo est� (posible apag�n)
                                      //Oculto los botones de "Entrar" y "Cancelar"
                                      lblbtnEntrar.Visible:= False;
                                      lblbtnCancelar.Visible:= False;

                                      //Le cambio el caption a la forma
                                      frmValidacionPuestoDeTrabajo.Caption:= 'BookLogger. Verificando conexi�n';

                                      //Muestro el ProgressBar
                                      ProgressBar1.Visible:= True;

                                      //Habilito el timer del progressBar
                                      TimerDelProgressBar.Enabled:= True;

                                      //Realizo la b�squeda de los datos de quien est� supuestamente loggeado
                                      BookLogger.BuscarAlLoggeado;

                                      //Tomo el valor de la hora actual del supuestamente loggeado y lo guardo
                                      HoraActual:= DBTextHoraActual.Field.Text;

                                      //Habilito el timer de muestreo de la hora actual
                                      TimerMuestreoDeHoraActual.Enabled:= True;
                                    end;
                          end
                            else
                              begin
                                //Elimino la conexi�n con la base de datos
                                BookLogger.EliminarConexionConLaBD;

                                ShowMessage('El usuario tecleado no existe en la base de datos.');

                                //Habilito los LabelEdits y Edit
                                edtServer.Enabled:= True;
                                lbledtUsuario.Enabled:= True;
                                lbledtContrasenna.Enabled:= True;

                                //Habilito el bot�n de "Entrar"
                                lblbtnEntrar.Enabled:= True;

                                //Limpio todo lo tecleado
                                LimpiarComponentes;

                                //Me paro en el Edit del usuario
                                lbledtUsuario.SetFocus;
                              end;
                    end
                      else
                        begin
                          ShowMessage('No existe conexi�n en estos momentos con la base de datos.' + #13 + 'Es imposible realizar la validaci�n en el sistema BookLogger.' + #13 + 'El sistema se cerrar�.');
                          Application.Terminate;
                        end;
              end
                else
                  begin
                    if (   (lbledtUsuario.Text= '') and (lbledtContrasenna.Text= '')   )
                      then
                        begin
                          //Elimino la conexi�n con la base de datos
                          BookLogger.EliminarConexionConLaBD;

                          //ShowMessage('Debe teclear el usuario y la contrase�a.');
                          Application.MessageBox('Debe teclear el usuario y la contrase�a.','Error',mb_Ok + mb_IconError);

                          //Habilito los LabelEdits y Edit
                          edtServer.Enabled:= True;
                          lbledtUsuario.Enabled:= True;
                          lbledtContrasenna.Enabled:= True;

                          //Habilito el bot�n de "Entrar"
                          lblbtnEntrar.Enabled:= True;

                          //Me paro en el Edit del usuario
                          lbledtUsuario.SetFocus;
                        end
                          else
                            begin
                              if (   (lbledtUsuario.Text= '') and (lbledtContrasenna.Text<> '')   )
                                then
                                  begin
                                     //Elimino la conexi�n con la base de datos
                                     BookLogger.EliminarConexionConLaBD;

                                    //ShowMessage('Debe teclear el usuario.');
                                    Application.MessageBox('Debe teclear el usuario.','Error',mb_Ok + mb_IconError);

                                    //Habilito los LabelEdits y Edit
                                    edtServer.Enabled:= True;
                                    lbledtUsuario.Enabled:= True;
                                    lbledtContrasenna.Enabled:= True;

                                    //Habilito el bot�n de "Entrar"
                                    lblbtnEntrar.Enabled:= True;

                                    //Me paro en el Edit del usuario
                                    lbledtUsuario.SetFocus;
                                  end
                                    else
                                      begin
                                        if (   (lbledtUsuario.Text<> '') and (lbledtContrasenna.Text= '')   )
                                          then
                                            begin
                                              //Elimino la conexi�n con la base de datos
                                              BookLogger.EliminarConexionConLaBD;

                                              //ShowMessage('Debe teclear la contrase�a.');
                                              Application.MessageBox('Debe teclear la contrase�a.','Error',mb_Ok + mb_IconError);

                                              //Habilito los LabelEdits y Edit
                                              edtServer.Enabled:= True;
                                              lbledtUsuario.Enabled:= True;
                                              lbledtContrasenna.Enabled:= True;

                                              //Habilito el bot�n de "Entrar"
                                              lblbtnEntrar.Enabled:= True;

                                              //Me paro en el Edit de la contrase�a
                                              lbledtContrasenna.SetFocus;
                                            end;
                                      end;
                            end;
                  end;



      end
        else
          begin
            //Elimino la conexi�n con la base de datos
            BookLogger.EliminarConexionConLaBD;

            //Saco un cartel
            Application.MessageBox('Falta el nombre del Server. Sin �l no se puede conectar el Sistema BookLogger a la base de datos.','Error',mb_Ok + mb_IconError);

            //Habilito los LabelEdits y Edit
            edtServer.Enabled:= True;
            lbledtUsuario.Enabled:= True;
            lbledtContrasenna.Enabled:= True;

            //Habilito el bot�n de "Entrar"
            lblbtnEntrar.Enabled:= True;

            //Me paro en el Edit del Server
            edtServer.SetFocus;
          end;




end;



procedure TfrmValidacionPuestoDeTrabajo.lbledtUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [#13]) then lblbtnEntrar.Click;

  //Valido para solo letras (sin espacios ni tildes)
  if not (Key in['a'..'z', 'A'..'Z', '�', '�', #8, #13]) then Abort;
end;


procedure TfrmValidacionPuestoDeTrabajo.LimpiarComponentes;
begin
  //Limpio los componentes de la forma de Loggeo
  lbledtUsuario.Clear;
  lbledtContrasenna.Clear;
end;



procedure TfrmValidacionPuestoDeTrabajo.lbledtContrasennaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [#13]) then lblbtnEntrar.Click;
end;



procedure TfrmValidacionPuestoDeTrabajo.FormShow(Sender: TObject);
const
  //clPaleGreen= TColor($CCFFCC);
  //clPaleRed= TColor($CCCCFF);
  clStrongRed=TColor($006C6CFF);
var 
  hMenuHandle : HMENU;
begin
  frmValidacionPuestoDeTrabajo.Caption:= 'BookLogger. Validaci�n de Entrada';

  //Habilito los LabelEdits y Edit
  edtServer.Enabled:= True;
  lbledtUsuario.Enabled:= True;
  lbledtContrasenna.Enabled:= True;

  //Habilito los botones de "Entrar" y "Cancelar"
  lblbtnEntrar.Enabled:= True;
  lblbtnCancelar.Enabled:= True;

  //Limpio los componentes
  //edtServer.Clear;
  //lbledtUsuario.Clear;
  //lbledtContrasenna.Clear;

  edtServer.SetFocus;  

  //Muestro los botones de "Entrar" y "Cancelar"
  lblbtnEntrar.Visible:= True;
  lblbtnCancelar.Visible:= True;

  //Le cambio el color al ProgressBar
  PostMessage(ProgressBar1.Handle, $0409, 0, clStrongRed);

  //Oculto el ProgressBar
  ProgressBar1.Visible:= False;

  //Reinicio la posici�n del ProgressBar
  ProgressBar1.Position:= 0;

  //Aqu� deshabilito el bot�n de Cerrar de la forma
  hMenuHandle := GetSystemMenu(frmValidacionPuestoDeTrabajo.Handle, FALSE);
  if (hMenuHandle <> 0)
    then
      DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);
end;



procedure TfrmValidacionPuestoDeTrabajo.TimerActualizacionPermanenciaTimer(Sender: TObject);
begin
  //Actualizo los datos de loggeo en la BD
  if (BookLogger.ExisteConexionConLaBD)
    then
      begin
        //Se realiza la actualizaci�n de permanencia
        BookLogger.ActualizarPermanencia;
      end;

end;



procedure TfrmValidacionPuestoDeTrabajo.TimerMuestreoDeHoraActualTimer(Sender: TObject);
var
 NuevaHoraActual: String;
begin
  //Realizo la b�squeda de los datos de quien est� loggeado
  BookLogger.BuscarAlLoggeado;

  //Tomo nuevamente la hora actual del supuestamente aun loggeado para comparar cambios
  NuevaHoraActual:= DBTextHoraActual.Field.Text;

  //Compruebo si hay cambios (permanencia)
  if (NuevaHoraActual <> HoraActual)
    then
      begin //Hay cambios (hay permanencia)
        //Se deshabilita el timer (�l mismo) para que se ejecute una sola vez
        TimerMuestreoDeHoraActual.Enabled:= False;

        //Realizo la b�squeda de los datos de quien est� loggeado
        BookLogger.BuscarAlLoggeado;

        //Se muestra la forma de notificaci�n de loggeo ocupado
        frmNotificacionDeAlguienLoggeado.Position:= poDesktopCenter;
        frmNotificacionDeAlguienLoggeado.ShowModal;

        //Elimino la conexi�n con la BD
        BookLogger.EliminarConexionConLaBD;

        //Cierro la aplicaci�n
        Application.Terminate;
      end
        else
          begin //No hay cambios  (no hay permanencia = apag�n)
            //Se deshabilita el timer (�l mismo) para que se ejecute una sola vez
            TimerMuestreoDeHoraActual.Enabled:= False;

            //Elimino el falso loggeo (producto de un apag�n)
            BookLogger.BorrarFalsoLoggeo;
            
            BookLogger.BuscarPuestoDeTrabajo(usuario);
            if (DBTextContrasenna.Field.Text = BookLogger.EncriptarSeudoaleatorio(contrasenna))
              then
                begin
                  //Busco al usuario como si fuese Administrador, para luego comprobar si lo hall�
                  BookLogger.SelecAdministrador(usuario);

                  //Tomo los valores restantes desde la forma
                  Privilegio:= DBTextPrivilegios.Field.Text;
                  NombreUsuario:= DBTextNombre.Field.Text;
                  PrimerApellido:= DBTextPrimerApellido.Field.Text;
                  SegundoApellido:= DBTextSegundoApellido.Field.Text;

                  //Ahora debo guardar el nuevo Loggin
                  BookLogger.LoggearAlUsuario(usuario, Privilegio, NombreUsuario, PrimerApellido, SegundoApellido);
                  //HostalWare.LoggearAlUsuario(lbledtUsuario.Text, Privilegio, NombreUsuario, PrimerApellido, SegundoApellido);

                  //Se habilita el timer para la actualizaci�n de permanencia
                  TimerActualizacionPermanencia.Enabled:= True;

                  //Cierro la forma
                  frmValidacionPuestoDeTrabajo.Close;
                end
                  else
                    begin
                      ShowMessage('Acceso denegado. Contrase�a incorrecta.');

                      //Habilito los LabelEdits y Edit
                      edtServer.Enabled:= True;
                      lbledtUsuario.Enabled:= True;
                      lbledtContrasenna.Enabled:= True;

                      //Habilito el bot�n de "Entrar"
                      lblbtnEntrar.Enabled:= True;

                      lbledtContrasenna.Clear;
                      lbledtContrasenna.SetFocus;
                    end;
          end;

end;



procedure TfrmValidacionPuestoDeTrabajo.TimerDelProgressBarTimer(
  Sender: TObject);
begin
  ProgressBar1.Position:= ProgressBar1.Position + 35;
  //TimerDelProgressBar.Enabled:= True;
  
  {if (ProgressBar1.Position = ProgressBar1.Max)
    then
      TimerDelProgressBar.Enabled:= False;}
end;



procedure TfrmValidacionPuestoDeTrabajo.edtServerKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key in [#13])
    then
      lblbtnEntrar.Click;

  //Sin espacios
  if (Key in[' ']) then Abort;
end;


procedure TfrmValidacionPuestoDeTrabajo.DeterminarResolucionInicial;
begin
  //Determino la resoluci�n inicial de la pantalla
  AnchoOriginalPantalla:= GetSysTemMetrics(SM_CXSCREEN);   {Ancho}
  AltoOriginalPantalla:= GetSysTemMetrics(SM_CYSCREEN);   {Alto}
end;



function TfrmValidacionPuestoDeTrabajo.CambiarResolucion(XRes, YRes: DWord):integer;
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


procedure TfrmValidacionPuestoDeTrabajo.FormCreate(Sender: TObject);
begin
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
end;



end.
