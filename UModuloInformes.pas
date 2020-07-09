unit UModuloInformes;

interface

uses
  Classes, DB, Dialogs,

  {Units echas por mi}
  UCapaSeguridad,
  UPlanilla1164_01,

  {DataModules echos por mi.}
  UDataModuleConexionGeneral, UDataModuleInformes;

type
  TModuloInformes = Class(TObject)

  
//************************************************
// ***  Procedimientos del M�dulo de Informes  ***
//************************************************



  //** Procedimientos de la pesta�a de la Planilla 1164-01 **
  procedure MostrarPlanillas1164_01Todas;
  procedure MostrarPlanillas1164_01PorAnno(aAnno: Integer);
  procedure MostrarPlanillas1164_01PorProvincia(aProvincia: AnsiString);
  procedure MostrarPlanillas1164_01PorProvinciaYAnno(aProvincia: AnsiString; aAnno: Integer);

  function CantidadPlanillas1164_01Todas: Integer;
  function CantidadPlanillas1164_01PorAnno: Integer;
  function CantidadPlanillas1164_01PorProvincia: Integer;
  function CantidadPlanillas1164_01PorProvinciaYAnno: Integer;

  procedure BuscarPlanilla1164_01PorCodigoYAnno(aCodigoCentroInformante: AnsiString; aAnno: Integer);
  procedure BuscarPlanilla1164_01PorID_Planilla(aID_Planilla: Integer);

  function ExistePlanilla1164_01PorCodigoYAnno: Boolean;

  procedure MostrarSumatoriaPlanillas1164_01PorAnno(aAnno: Integer);
  
  procedure InsertarPlanilla1164_01(aPlanilla: TPlanilla1164_01);
  procedure EliminarPlanilla1164_01PorID_Planilla(aID_Planilla: Integer);
  procedure ModificarPlanilla1164_01PorID_Planilla(aPlanilla: TPlanilla1164_01);

  procedure MostrarMunicipiosParaPlanilla1164_01PorNombreProvincia(aNombreProvincia: AnsiString);
  procedure BuscarID_MunicipioParaPlanilla1164_01PorNombreMunicipio(aNombreMunicipio: AnsiString);






  private
    { Private declarations }

  public
    { Public declarations }

    

end;

implementation

uses SysUtils, ConvUtils;

//var




//---------------- *** Pesta�a de Planilla 1164-01 *** ------------------------






{ TGestionDocente }

procedure TModuloInformes.BuscarID_MunicipioParaPlanilla1164_01PorNombreMunicipio(aNombreMunicipio: AnsiString);
begin
  //Se realiza la conexi�n con la BD
  DataModuleConexionGeneral.ADOConnectionGeneral.Connected:= True;
  DataModuleInformes.spSelecID_MunicipioParaPlanilla1164_01PorNombreMunicipio.Active:= False;

  //*** Le pasamos el par�metro al StoredProc. ***
  DataModuleInformes.spSelecID_MunicipioParaPlanilla1164_01PorNombreMunicipio.Parameters.ParamByName('@vNombreMunicipio').Value:= aNombreMunicipio;

  //Aqu� se hace la busqueda de datos, en la BD
  DataModuleInformes.spSelecID_MunicipioParaPlanilla1164_01PorNombreMunicipio.Open; //<- S� genera datos de respuesta el StoredProc, por eso se muestra esto.
  DataModuleInformes.spSelecID_MunicipioParaPlanilla1164_01PorNombreMunicipio.ExecProc;
end;



procedure TModuloInformes.BuscarPlanilla1164_01PorCodigoYAnno(aCodigoCentroInformante: AnsiString; aAnno: Integer);
begin
  //Se realiza la conexi�n con la BD
  DataModuleConexionGeneral.ADOConnectionGeneral.Connected:= True;
  DataModuleInformes.spSelecPlanilla1164_01PorCodigoYAnno.Active:= False;

  //*** Le pasamos los par�metros de la Planilla 1164-01, al StoredProc. ***
  //Posicionamiento
  DataModuleInformes.spSelecPlanilla1164_01PorCodigoYAnno.Parameters.ParamByName('@vCodigoCentroInformante').Value:= aCodigoCentroInformante;
  DataModuleInformes.spSelecPlanilla1164_01PorCodigoYAnno.Parameters.ParamByName('@vAnno').Value:= aAnno;

  //Aqu� se hace la busqueda de datos, en la BD
  DataModuleInformes.spSelecPlanilla1164_01PorCodigoYAnno.Open; //<- S� genera datos de respuesta el StoredProc, por eso se muestra esto.
  DataModuleInformes.spSelecPlanilla1164_01PorCodigoYAnno.ExecProc;
end;



procedure TModuloInformes.BuscarPlanilla1164_01PorID_Planilla(aID_Planilla: Integer);
begin
  //Se realiza la conexi�n con la BD
  DataModuleConexionGeneral.ADOConnectionGeneral.Connected:= True;
  DataModuleInformes.spSelecPlanilla1164_01PorID_Planilla.Active:= False;

  //*** Le pasamos los par�metros de la Planilla 1164-01, al StoredProc. ***
  //Posicionamiento
  DataModuleInformes.spSelecPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vID_Planilla').Value:= aID_Planilla;

  //Aqu� se hace la busqueda de datos, en la BD
  DataModuleInformes.spSelecPlanilla1164_01PorID_Planilla.Open; //<- S� genera datos de respuesta el StoredProc, por eso se muestra esto.
  DataModuleInformes.spSelecPlanilla1164_01PorID_Planilla.ExecProc;
end;



function TModuloInformes.CantidadPlanillas1164_01PorAnno: Integer;
begin
 //Determinamos la cantidad de planillas 1164-01
 if (DataModuleInformes.dsSelecPlanillas1164_01PorAnno.DataSet.RecordCount <> 0)
   then
     begin
       Result:= DataModuleInformes.dsSelecPlanillas1164_01PorAnno.DataSet.RecordCount;
     end
       else
         begin
           Result:= 0;
         end;
end;



function TModuloInformes.CantidadPlanillas1164_01PorProvincia: Integer;
begin
 //Determinamos la cantidad de planillas 1164-01
 if (DataModuleInformes.dsSelecPlanillas1164_01PorProvincia.DataSet.RecordCount <> 0)
   then
     begin
       Result:= DataModuleInformes.dsSelecPlanillas1164_01PorProvincia.DataSet.RecordCount;
     end
       else
         begin
           Result:= 0;
         end;
end;



function TModuloInformes.CantidadPlanillas1164_01PorProvinciaYAnno: Integer;
begin
 //Determinamos la cantidad de planillas 1164-01
 if (DataModuleInformes.dsSelecPlanillas1164_01PorProvinciaYAnno.DataSet.RecordCount <> 0)
   then
     begin
       Result:= DataModuleInformes.dsSelecPlanillas1164_01PorProvinciaYAnno.DataSet.RecordCount;
     end
       else
         begin
           Result:= 0;
         end;
end;



function TModuloInformes.CantidadPlanillas1164_01Todas: Integer;
begin
 //Determinamos la cantidad de planillas 1164-01
 if (DataModuleInformes.dsSelecPlanillas1164_01Todas.DataSet.RecordCount <> 0)
   then
     begin
       Result:= DataModuleInformes.dsSelecPlanillas1164_01Todas.DataSet.RecordCount;
     end
       else
         begin
           Result:= 0;
         end;
end;



procedure TModuloInformes.EliminarPlanilla1164_01PorID_Planilla(aID_Planilla: Integer);
begin
  //Se realiza la conexi�n con la BD
  DataModuleConexionGeneral.ADOConnectionGeneral.Connected:= True;
  DataModuleInformes.spEliminarPlanilla1164_01PorID_Planilla.Active:= False;

  //*** Le pasamos los par�metros de la Planilla 1164-01, al StoredProc. ***
  //Posicionamiento
  DataModuleInformes.spEliminarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vID_Planilla').Value:= aID_Planilla;

  //Aqu� se hace la busqueda de datos, en la BD
  //DataModuleInformes.spEliminarPlanilla1164_01PorID_Planilla.Open; //<- NO Genera datos de respuesta el StoredProc, por eso se oculta esto.
  DataModuleInformes.spEliminarPlanilla1164_01PorID_Planilla.ExecProc;
end;



function TModuloInformes.ExistePlanilla1164_01PorCodigoYAnno: Boolean;
begin
 //Verificamos que la Planilla 1164-01 halla aparecido
 if (DataModuleInformes.dsSelecPlanilla1164_01PorCodigoYAnno.DataSet.RecordCount <> 0)
   then
     begin
       Result:= True;
     end
       else
         begin
           Result:= False;
         end;
end;



procedure TModuloInformes.InsertarPlanilla1164_01(aPlanilla: TPlanilla1164_01);
begin
  //Se realiza la conexi�n con la BD
  DataModuleConexionGeneral.ADOConnectionGeneral.Connected:= True;
  DataModuleInformes.spInsertarPlanilla1164_01.Active:= False;

  //*** Le pasamos los par�metros de la Planilla 1164-01, al StoredProc. ***
  //Posicionamiento
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vAnno').Value:= aPlanilla.Anno;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vMunicipio').Value:= aPlanilla.Municipio;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vProvincia').Value:= aPlanilla.Provincia;


  //Datos Generales
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vNombreCentroInformante').Value:= aPlanilla.NombreCentroInformante;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vCodigoCentroInformante').Value:= aPlanilla.CodigoCentroInformante;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vNombreDirectorEconomico').Value:= aPlanilla.NombreDirectorEconomico;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vNombreRectorODirector').Value:= aPlanilla.NombreRectorODirector;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vFechaConfeccion').Value:= aPlanilla.FechaConfeccion;


  //Secci�n I: Caracterizaci�n
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDoctoresXTotal').Value:= aPlanilla.DoctoresXTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDoctoresXCantGrad').Value:= aPlanilla.DoctoresXCantGrad;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDoctoresXCantParticip').Value:= aPlanilla.DoctoresXCantParticip;



  //Secci�n II: Superaci�n Profesional
  //Diplomados
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDiplomadosXCantActivTotal').Value:= aPlanilla.DiplomadosXCantActivTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDiplomadosXCantActivUnivMun').Value:= aPlanilla.DiplomadosXCantActivUnivMun;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDiplomadosXCantActivADistancia').Value:= aPlanilla.DiplomadosXCantActivADistancia;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDiplomadosXCantActivExtranjero').Value:= aPlanilla.DiplomadosXCantActivExtranjero;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDiplomadosXCantParticipTotal').Value:= aPlanilla.DiplomadosXCantParticipTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDiplomadosXCantParticipMujeres').Value:= aPlanilla.DiplomadosXCantParticipMujeres;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDiplomadosXCantParticipExtranjeros').Value:= aPlanilla.DiplomadosXCantParticipExtranjeros;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDiplomadosXCantParticipProfTC').Value:= aPlanilla.DiplomadosXCantParticipProfTC;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDiplomadosXCantParticipProfTP').Value:= aPlanilla.DiplomadosXCantParticipProfTP;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDiplomadosXCantParticipUnivMun').Value:= aPlanilla.DiplomadosXCantParticipUnivMun;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDiplomadosXCantParticipADistancia').Value:= aPlanilla.DiplomadosXCantParticipADistancia;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDiplomadosXCantGradTotal').Value:= aPlanilla.DiplomadosXCantGradTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDiplomadosXCantGradMujeres').Value:= aPlanilla.DiplomadosXCantGradMujeres;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDiplomadosXCantGradExtranjeros').Value:= aPlanilla.DiplomadosXCantGradExtranjeros;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDiplomadosXCantGradProfTC').Value:= aPlanilla.DiplomadosXCantGradProfTC;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDiplomadosXCantGradProfTP').Value:= aPlanilla.DiplomadosXCantGradProfTP;

  //Entrenamientos
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEntrenamientosXCantActivTotal').Value:= aPlanilla.EntrenamientosXCantActivTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEntrenamientosXCantActivUnivMun').Value:= aPlanilla.EntrenamientosXCantActivUnivMun;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEntrenamientosXCantActivADistancia').Value:= aPlanilla.EntrenamientosXCantActivADistancia;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEntrenamientosXCantActivExtranjero').Value:= aPlanilla.EntrenamientosXCantActivExtranjero;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEntrenamientosXCantParticipTotal').Value:= aPlanilla.EntrenamientosXCantParticipTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEntrenamientosXCantParticipMujeres').Value:= aPlanilla.EntrenamientosXCantParticipMujeres;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEntrenamientosXCantParticipExtranjeros').Value:= aPlanilla.EntrenamientosXCantParticipExtranjeros;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEntrenamientosXCantParticipProfTC').Value:= aPlanilla.EntrenamientosXCantParticipProfTC;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEntrenamientosXCantParticipProfTP').Value:= aPlanilla.EntrenamientosXCantParticipProfTP;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEntrenamientosXCantParticipUnivMun').Value:= aPlanilla.EntrenamientosXCantParticipUnivMun;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEntrenamientosXCantParticipADistancia').Value:= aPlanilla.EntrenamientosXCantParticipADistancia;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEntrenamientosXCantGradTotal').Value:= aPlanilla.EntrenamientosXCantGradTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEntrenamientosXCantGradMujeres').Value:= aPlanilla.EntrenamientosXCantGradMujeres;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEntrenamientosXCantGradExtranjeros').Value:= aPlanilla.EntrenamientosXCantGradExtranjeros;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEntrenamientosXCantGradProfTC').Value:= aPlanilla.EntrenamientosXCantGradProfTC;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEntrenamientosXCantGradProfTP').Value:= aPlanilla.EntrenamientosXCantGradProfTP;

  //Cursos
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vCursosXCantActivTotal').Value:= aPlanilla.CursosXCantActivTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vCursosXCantActivUnivMun').Value:= aPlanilla.CursosXCantActivUnivMun;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vCursosXCantActivADistancia').Value:= aPlanilla.CursosXCantActivADistancia;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vCursosXCantActivExtranjero').Value:= aPlanilla.CursosXCantActivExtranjero;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vCursosXCantParticipTotal').Value:= aPlanilla.CursosXCantParticipTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vCursosXCantParticipMujeres').Value:= aPlanilla.CursosXCantParticipMujeres;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vCursosXCantParticipExtranjeros').Value:= aPlanilla.CursosXCantParticipExtranjeros;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vCursosXCantParticipProfTC').Value:= aPlanilla.CursosXCantParticipProfTC;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vCursosXCantParticipProfTP').Value:= aPlanilla.CursosXCantParticipProfTP;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vCursosXCantParticipUnivMun').Value:= aPlanilla.CursosXCantParticipUnivMun;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vCursosXCantParticipADistancia').Value:= aPlanilla.CursosXCantParticipADistancia;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vCursosXCantGradTotal').Value:= aPlanilla.CursosXCantGradTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vCursosXCantGradMujeres').Value:= aPlanilla.CursosXCantGradMujeres;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vCursosXCantGradExtranjeros').Value:= aPlanilla.CursosXCantGradExtranjeros;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vCursosXCantGradProfTC').Value:= aPlanilla.CursosXCantGradProfTC;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vCursosXCantGradProfTP').Value:= aPlanilla.CursosXCantGradProfTP;

  //SubTotal II
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal2XCantActivTotal').Value:= aPlanilla.SubTotal2XCantActivTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal2XCantActivUnivMun').Value:= aPlanilla.SubTotal2XCantActivUnivMun;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal2XCantActivADistancia').Value:= aPlanilla.SubTotal2XCantActivADistancia;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal2XCantActivExtranjero').Value:= aPlanilla.SubTotal2XCantActivExtranjero;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal2XCantParticipTotal').Value:= aPlanilla.SubTotal2XCantParticipTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal2XCantParticipMujeres').Value:= aPlanilla.SubTotal2XCantParticipMujeres;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal2XCantParticipExtranjeros').Value:= aPlanilla.SubTotal2XCantParticipExtranjeros;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal2XCantParticipProfTC').Value:= aPlanilla.SubTotal2XCantParticipProfTC;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal2XCantParticipProfTP').Value:= aPlanilla.SubTotal2XCantParticipProfTP;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal2XCantParticipUnivMun').Value:= aPlanilla.SubTotal2XCantParticipUnivMun;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal2XCantParticipADistancia').Value:= aPlanilla.SubTotal2XCantParticipADistancia;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal2XCantGradTotal').Value:= aPlanilla.SubTotal2XCantGradTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal2XCantGradMujeres').Value:= aPlanilla.SubTotal2XCantGradMujeres;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal2XCantGradExtranjeros').Value:= aPlanilla.SubTotal2XCantGradExtranjeros;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal2XCantGradProfTC').Value:= aPlanilla.SubTotal2XCantGradProfTC;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal2XCantGradProfTP').Value:= aPlanilla.SubTotal2XCantGradProfTP;


  //Secci�n II: Postgrado Acad�mico

  //Doctorados
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDoctoradosXCantActivTotal').Value:= aPlanilla.DoctoradosXCantActivTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDoctoradosXCantActivUnivMun').Value:= aPlanilla.DoctoradosXCantActivUnivMun;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDoctoradosXCantActivADistancia').Value:= aPlanilla.DoctoradosXCantActivADistancia;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDoctoradosXCantActivExtranjero').Value:= aPlanilla.DoctoradosXCantActivExtranjero;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDoctoradosXCantParticipTotal').Value:= aPlanilla.DoctoradosXCantParticipTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDoctoradosXCantParticipMujeres').Value:= aPlanilla.DoctoradosXCantParticipMujeres;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDoctoradosXCantParticipExtranjeros').Value:= aPlanilla.DoctoradosXCantParticipExtranjeros;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDoctoradosXCantParticipProfTC').Value:= aPlanilla.DoctoradosXCantParticipProfTC;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDoctoradosXCantParticipProfTP').Value:= aPlanilla.DoctoradosXCantParticipProfTP;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDoctoradosXCantParticipUnivMun').Value:= aPlanilla.DoctoradosXCantParticipUnivMun;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDoctoradosXCantParticipADistancia').Value:= aPlanilla.DoctoradosXCantParticipADistancia;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDoctoradosXCantGradTotal').Value:= aPlanilla.DoctoradosXCantGradTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDoctoradosXCantGradMujeres').Value:= aPlanilla.DoctoradosXCantGradMujeres;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDoctoradosXCantGradExtranjeros').Value:= aPlanilla.DoctoradosXCantGradExtranjeros;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDoctoradosXCantGradProfTC').Value:= aPlanilla.DoctoradosXCantGradProfTC;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vDoctoradosXCantGradProfTP').Value:= aPlanilla.DoctoradosXCantGradProfTP;

  //Especialidades
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEspecialidadesXCantActivTotal').Value:= aPlanilla.EspecialidadesXCantActivTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEspecialidadesXCantActivUnivMun').Value:= aPlanilla.EspecialidadesXCantActivUnivMun;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEspecialidadesXCantActivADistancia').Value:= aPlanilla.EspecialidadesXCantActivADistancia;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEspecialidadesXCantActivExtranjero').Value:= aPlanilla.EspecialidadesXCantActivExtranjero;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEspecialidadesXCantParticipTotal').Value:= aPlanilla.EspecialidadesXCantParticipTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEspecialidadesXCantParticipMujeres').Value:= aPlanilla.EspecialidadesXCantParticipMujeres;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEspecialidadesXCantParticipExtranjeros').Value:= aPlanilla.EspecialidadesXCantParticipExtranjeros;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEspecialidadesXCantParticipProfTC').Value:= aPlanilla.EspecialidadesXCantParticipProfTC;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEspecialidadesXCantParticipProfTP').Value:= aPlanilla.EspecialidadesXCantParticipProfTP;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEspecialidadesXCantParticipUnivMun').Value:= aPlanilla.EspecialidadesXCantParticipUnivMun;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEspecialidadesXCantParticipADistancia').Value:= aPlanilla.EspecialidadesXCantParticipADistancia;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEspecialidadesXCantGradTotal').Value:= aPlanilla.EspecialidadesXCantGradTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEspecialidadesXCantGradMujeres').Value:= aPlanilla.EspecialidadesXCantGradMujeres;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEspecialidadesXCantGradExtranjeros').Value:= aPlanilla.EspecialidadesXCantGradExtranjeros;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEspecialidadesXCantGradProfTC').Value:= aPlanilla.EspecialidadesXCantGradProfTC;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vEspecialidadesXCantGradProfTP').Value:= aPlanilla.EspecialidadesXCantGradProfTP;

  //Maestr�as
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vMaestriasXCantActivTotal').Value:= aPlanilla.MaestriasXCantActivTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vMaestriasXCantActivUnivMun').Value:= aPlanilla.MaestriasXCantActivUnivMun;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vMaestriasXCantActivADistancia').Value:= aPlanilla.MaestriasXCantActivADistancia;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vMaestriasXCantActivExtranjero').Value:= aPlanilla.MaestriasXCantActivExtranjero;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vMaestriasXCantParticipTotal').Value:= aPlanilla.MaestriasXCantParticipTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vMaestriasXCantParticipMujeres').Value:= aPlanilla.MaestriasXCantParticipMujeres;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vMaestriasXCantParticipExtranjeros').Value:= aPlanilla.MaestriasXCantParticipExtranjeros;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vMaestriasXCantParticipProfTC').Value:= aPlanilla.MaestriasXCantParticipProfTC;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vMaestriasXCantParticipProfTP').Value:= aPlanilla.MaestriasXCantParticipProfTP;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vMaestriasXCantParticipUnivMun').Value:= aPlanilla.MaestriasXCantParticipUnivMun;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vMaestriasXCantParticipADistancia').Value:= aPlanilla.MaestriasXCantParticipADistancia;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vMaestriasXCantGradTotal').Value:= aPlanilla.MaestriasXCantGradTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vMaestriasXCantGradMujeres').Value:= aPlanilla.MaestriasXCantGradMujeres;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vMaestriasXCantGradExtranjeros').Value:= aPlanilla.MaestriasXCantGradExtranjeros;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vMaestriasXCantGradProfTC').Value:= aPlanilla.MaestriasXCantGradProfTC;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vMaestriasXCantGradProfTP').Value:= aPlanilla.MaestriasXCantGradProfTP;

  //SubTotal III
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal3XCantActivTotal').Value:= aPlanilla.SubTotal3XCantActivTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal3XCantActivUnivMun').Value:= aPlanilla.SubTotal3XCantActivUnivMun;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal3XCantActivADistancia').Value:= aPlanilla.SubTotal3XCantActivADistancia;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal3XCantActivExtranjero').Value:= aPlanilla.SubTotal3XCantActivExtranjero;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal3XCantParticipTotal').Value:= aPlanilla.SubTotal3XCantParticipTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal3XCantParticipMujeres').Value:= aPlanilla.SubTotal3XCantParticipMujeres;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal3XCantParticipExtranjeros').Value:= aPlanilla.SubTotal3XCantParticipExtranjeros;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal3XCantParticipProfTC').Value:= aPlanilla.SubTotal3XCantParticipProfTC;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal3XCantParticipProfTP').Value:= aPlanilla.SubTotal3XCantParticipProfTP;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal3XCantParticipUnivMun').Value:= aPlanilla.SubTotal3XCantParticipUnivMun;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal3XCantParticipADistancia').Value:= aPlanilla.SubTotal3XCantParticipADistancia;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal3XCantGradTotal').Value:= aPlanilla.SubTotal3XCantGradTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal3XCantGradMujeres').Value:= aPlanilla.SubTotal3XCantGradMujeres;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal3XCantGradExtranjeros').Value:= aPlanilla.SubTotal3XCantGradExtranjeros;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal3XCantGradProfTC').Value:= aPlanilla.SubTotal3XCantGradProfTC;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vSubTotal3XCantGradProfTP').Value:= aPlanilla.SubTotal3XCantGradProfTP;


  //Total
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vTotalXCantActivTotal').Value:= aPlanilla.TotalXCantActivTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vTotalXCantActivUnivMun').Value:= aPlanilla.TotalXCantActivUnivMun;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vTotalXCantActivADistancia').Value:= aPlanilla.TotalXCantActivADistancia;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vTotalXCantActivExtranjero').Value:= aPlanilla.TotalXCantActivExtranjero;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vTotalXCantParticipTotal').Value:= aPlanilla.TotalXCantParticipTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vTotalXCantParticipMujeres').Value:= aPlanilla.TotalXCantParticipMujeres;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vTotalXCantParticipExtranjeros').Value:= aPlanilla.TotalXCantParticipExtranjeros;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vTotalXCantParticipProfTC').Value:= aPlanilla.TotalXCantParticipProfTC;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vTotalXCantParticipProfTP').Value:= aPlanilla.TotalXCantParticipProfTP;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vTotalXCantParticipUnivMun').Value:= aPlanilla.TotalXCantParticipUnivMun;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vTotalXCantParticipADistancia').Value:= aPlanilla.TotalXCantParticipADistancia;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vTotalXCantGradTotal').Value:= aPlanilla.TotalXCantGradTotal;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vTotalXCantGradMujeres').Value:= aPlanilla.TotalXCantGradMujeres;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vTotalXCantGradExtranjeros').Value:= aPlanilla.TotalXCantGradExtranjeros;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vTotalXCantGradProfTC').Value:= aPlanilla.TotalXCantGradProfTC;
  DataModuleInformes.spInsertarPlanilla1164_01.Parameters.ParamByName('@vTotalXCantGradProfTP').Value:= aPlanilla.TotalXCantGradProfTP;

  //Aqu� se hace la inserci�n de datos, en la BD
  //DataModuleInformes.spInsertarPlanilla1164_01.Open; //<- NO Genera datos de respuesta el StoredProc, por eso se oculta esto.
  DataModuleInformes.spInsertarPlanilla1164_01.ExecProc;  
end;



procedure TModuloInformes.ModificarPlanilla1164_01PorID_Planilla(aPlanilla: TPlanilla1164_01);
begin
  //Se realiza la conexi�n con la BD
  DataModuleConexionGeneral.ADOConnectionGeneral.Connected:= True;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Active:= False;

  //*** Le pasamos los par�metros de la Planilla 1164-01, al StoredProc. ***
  //Posicionamiento
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vID_Planilla').Value:= aPlanilla.ID_Planilla;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vAnno').Value:= aPlanilla.Anno;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vMunicipio').Value:= aPlanilla.Municipio;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vProvincia').Value:= aPlanilla.Provincia;


  //Datos Generales
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vNombreCentroInformante').Value:= aPlanilla.NombreCentroInformante;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vCodigoCentroInformante').Value:= aPlanilla.CodigoCentroInformante;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vNombreDirectorEconomico').Value:= aPlanilla.NombreDirectorEconomico;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vNombreRectorODirector').Value:= aPlanilla.NombreRectorODirector;
  //DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vFechaConfeccion').Value:= aPlanilla.FechaConfeccion;


  //Secci�n I: Caracterizaci�n
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDoctoresXTotal').Value:= aPlanilla.DoctoresXTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDoctoresXCantGrad').Value:= aPlanilla.DoctoresXCantGrad;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDoctoresXCantParticip').Value:= aPlanilla.DoctoresXCantParticip;



  //Secci�n II: Superaci�n Profesional
  //Diplomados
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDiplomadosXCantActivTotal').Value:= aPlanilla.DiplomadosXCantActivTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDiplomadosXCantActivUnivMun').Value:= aPlanilla.DiplomadosXCantActivUnivMun;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDiplomadosXCantActivADistancia').Value:= aPlanilla.DiplomadosXCantActivADistancia;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDiplomadosXCantActivExtranjero').Value:= aPlanilla.DiplomadosXCantActivExtranjero;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDiplomadosXCantParticipTotal').Value:= aPlanilla.DiplomadosXCantParticipTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDiplomadosXCantParticipMujeres').Value:= aPlanilla.DiplomadosXCantParticipMujeres;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDiplomadosXCantParticipExtranjeros').Value:= aPlanilla.DiplomadosXCantParticipExtranjeros;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDiplomadosXCantParticipProfTC').Value:= aPlanilla.DiplomadosXCantParticipProfTC;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDiplomadosXCantParticipProfTP').Value:= aPlanilla.DiplomadosXCantParticipProfTP;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDiplomadosXCantParticipUnivMun').Value:= aPlanilla.DiplomadosXCantParticipUnivMun;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDiplomadosXCantParticipADistancia').Value:= aPlanilla.DiplomadosXCantParticipADistancia;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDiplomadosXCantGradTotal').Value:= aPlanilla.DiplomadosXCantGradTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDiplomadosXCantGradMujeres').Value:= aPlanilla.DiplomadosXCantGradMujeres;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDiplomadosXCantGradExtranjeros').Value:= aPlanilla.DiplomadosXCantGradExtranjeros;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDiplomadosXCantGradProfTC').Value:= aPlanilla.DiplomadosXCantGradProfTC;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDiplomadosXCantGradProfTP').Value:= aPlanilla.DiplomadosXCantGradProfTP;

  //Entrenamientos
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEntrenamientosXCantActivTotal').Value:= aPlanilla.EntrenamientosXCantActivTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEntrenamientosXCantActivUnivMun').Value:= aPlanilla.EntrenamientosXCantActivUnivMun;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEntrenamientosXCantActivADistancia').Value:= aPlanilla.EntrenamientosXCantActivADistancia;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEntrenamientosXCantActivExtranjero').Value:= aPlanilla.EntrenamientosXCantActivExtranjero;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEntrenamientosXCantParticipTotal').Value:= aPlanilla.EntrenamientosXCantParticipTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEntrenamientosXCantParticipMujeres').Value:= aPlanilla.EntrenamientosXCantParticipMujeres;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEntrenamientosXCantParticipExtranjeros').Value:= aPlanilla.EntrenamientosXCantParticipExtranjeros;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEntrenamientosXCantParticipProfTC').Value:= aPlanilla.EntrenamientosXCantParticipProfTC;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEntrenamientosXCantParticipProfTP').Value:= aPlanilla.EntrenamientosXCantParticipProfTP;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEntrenamientosXCantParticipUnivMun').Value:= aPlanilla.EntrenamientosXCantParticipUnivMun;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEntrenamientosXCantParticipADistancia').Value:= aPlanilla.EntrenamientosXCantParticipADistancia;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEntrenamientosXCantGradTotal').Value:= aPlanilla.EntrenamientosXCantGradTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEntrenamientosXCantGradMujeres').Value:= aPlanilla.EntrenamientosXCantGradMujeres;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEntrenamientosXCantGradExtranjeros').Value:= aPlanilla.EntrenamientosXCantGradExtranjeros;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEntrenamientosXCantGradProfTC').Value:= aPlanilla.EntrenamientosXCantGradProfTC;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEntrenamientosXCantGradProfTP').Value:= aPlanilla.EntrenamientosXCantGradProfTP;

  //Cursos
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vCursosXCantActivTotal').Value:= aPlanilla.CursosXCantActivTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vCursosXCantActivUnivMun').Value:= aPlanilla.CursosXCantActivUnivMun;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vCursosXCantActivADistancia').Value:= aPlanilla.CursosXCantActivADistancia;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vCursosXCantActivExtranjero').Value:= aPlanilla.CursosXCantActivExtranjero;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vCursosXCantParticipTotal').Value:= aPlanilla.CursosXCantParticipTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vCursosXCantParticipMujeres').Value:= aPlanilla.CursosXCantParticipMujeres;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vCursosXCantParticipExtranjeros').Value:= aPlanilla.CursosXCantParticipExtranjeros;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vCursosXCantParticipProfTC').Value:= aPlanilla.CursosXCantParticipProfTC;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vCursosXCantParticipProfTP').Value:= aPlanilla.CursosXCantParticipProfTP;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vCursosXCantParticipUnivMun').Value:= aPlanilla.CursosXCantParticipUnivMun;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vCursosXCantParticipADistancia').Value:= aPlanilla.CursosXCantParticipADistancia;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vCursosXCantGradTotal').Value:= aPlanilla.CursosXCantGradTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vCursosXCantGradMujeres').Value:= aPlanilla.CursosXCantGradMujeres;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vCursosXCantGradExtranjeros').Value:= aPlanilla.CursosXCantGradExtranjeros;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vCursosXCantGradProfTC').Value:= aPlanilla.CursosXCantGradProfTC;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vCursosXCantGradProfTP').Value:= aPlanilla.CursosXCantGradProfTP;

  //SubTotal II
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal2XCantActivTotal').Value:= aPlanilla.SubTotal2XCantActivTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal2XCantActivUnivMun').Value:= aPlanilla.SubTotal2XCantActivUnivMun;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal2XCantActivADistancia').Value:= aPlanilla.SubTotal2XCantActivADistancia;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal2XCantActivExtranjero').Value:= aPlanilla.SubTotal2XCantActivExtranjero;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal2XCantParticipTotal').Value:= aPlanilla.SubTotal2XCantParticipTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal2XCantParticipMujeres').Value:= aPlanilla.SubTotal2XCantParticipMujeres;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal2XCantParticipExtranjeros').Value:= aPlanilla.SubTotal2XCantParticipExtranjeros;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal2XCantParticipProfTC').Value:= aPlanilla.SubTotal2XCantParticipProfTC;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal2XCantParticipProfTP').Value:= aPlanilla.SubTotal2XCantParticipProfTP;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal2XCantParticipUnivMun').Value:= aPlanilla.SubTotal2XCantParticipUnivMun;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal2XCantParticipADistancia').Value:= aPlanilla.SubTotal2XCantParticipADistancia;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal2XCantGradTotal').Value:= aPlanilla.SubTotal2XCantGradTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal2XCantGradMujeres').Value:= aPlanilla.SubTotal2XCantGradMujeres;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal2XCantGradExtranjeros').Value:= aPlanilla.SubTotal2XCantGradExtranjeros;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal2XCantGradProfTC').Value:= aPlanilla.SubTotal2XCantGradProfTC;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal2XCantGradProfTP').Value:= aPlanilla.SubTotal2XCantGradProfTP;


  //Secci�n II: Postgrado Acad�mico

  //Doctorados
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDoctoradosXCantActivTotal').Value:= aPlanilla.DoctoradosXCantActivTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDoctoradosXCantActivUnivMun').Value:= aPlanilla.DoctoradosXCantActivUnivMun;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDoctoradosXCantActivADistancia').Value:= aPlanilla.DoctoradosXCantActivADistancia;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDoctoradosXCantActivExtranjero').Value:= aPlanilla.DoctoradosXCantActivExtranjero;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDoctoradosXCantParticipTotal').Value:= aPlanilla.DoctoradosXCantParticipTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDoctoradosXCantParticipMujeres').Value:= aPlanilla.DoctoradosXCantParticipMujeres;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDoctoradosXCantParticipExtranjeros').Value:= aPlanilla.DoctoradosXCantParticipExtranjeros;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDoctoradosXCantParticipProfTC').Value:= aPlanilla.DoctoradosXCantParticipProfTC;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDoctoradosXCantParticipProfTP').Value:= aPlanilla.DoctoradosXCantParticipProfTP;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDoctoradosXCantParticipUnivMun').Value:= aPlanilla.DoctoradosXCantParticipUnivMun;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDoctoradosXCantParticipADistancia').Value:= aPlanilla.DoctoradosXCantParticipADistancia;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDoctoradosXCantGradTotal').Value:= aPlanilla.DoctoradosXCantGradTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDoctoradosXCantGradMujeres').Value:= aPlanilla.DoctoradosXCantGradMujeres;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDoctoradosXCantGradExtranjeros').Value:= aPlanilla.DoctoradosXCantGradExtranjeros;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDoctoradosXCantGradProfTC').Value:= aPlanilla.DoctoradosXCantGradProfTC;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vDoctoradosXCantGradProfTP').Value:= aPlanilla.DoctoradosXCantGradProfTP;

  //Especialidades
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEspecialidadesXCantActivTotal').Value:= aPlanilla.EspecialidadesXCantActivTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEspecialidadesXCantActivUnivMun').Value:= aPlanilla.EspecialidadesXCantActivUnivMun;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEspecialidadesXCantActivADistancia').Value:= aPlanilla.EspecialidadesXCantActivADistancia;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEspecialidadesXCantActivExtranjero').Value:= aPlanilla.EspecialidadesXCantActivExtranjero;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEspecialidadesXCantParticipTotal').Value:= aPlanilla.EspecialidadesXCantParticipTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEspecialidadesXCantParticipMujeres').Value:= aPlanilla.EspecialidadesXCantParticipMujeres;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEspecialidadesXCantParticipExtranjeros').Value:= aPlanilla.EspecialidadesXCantParticipExtranjeros;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEspecialidadesXCantParticipProfTC').Value:= aPlanilla.EspecialidadesXCantParticipProfTC;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEspecialidadesXCantParticipProfTP').Value:= aPlanilla.EspecialidadesXCantParticipProfTP;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEspecialidadesXCantParticipUnivMun').Value:= aPlanilla.EspecialidadesXCantParticipUnivMun;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEspecialidadesXCantParticipADistancia').Value:= aPlanilla.EspecialidadesXCantParticipADistancia;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEspecialidadesXCantGradTotal').Value:= aPlanilla.EspecialidadesXCantGradTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEspecialidadesXCantGradMujeres').Value:= aPlanilla.EspecialidadesXCantGradMujeres;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEspecialidadesXCantGradExtranjeros').Value:= aPlanilla.EspecialidadesXCantGradExtranjeros;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEspecialidadesXCantGradProfTC').Value:= aPlanilla.EspecialidadesXCantGradProfTC;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vEspecialidadesXCantGradProfTP').Value:= aPlanilla.EspecialidadesXCantGradProfTP;

  //Maestr�as
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vMaestriasXCantActivTotal').Value:= aPlanilla.MaestriasXCantActivTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vMaestriasXCantActivUnivMun').Value:= aPlanilla.MaestriasXCantActivUnivMun;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vMaestriasXCantActivADistancia').Value:= aPlanilla.MaestriasXCantActivADistancia;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vMaestriasXCantActivExtranjero').Value:= aPlanilla.MaestriasXCantActivExtranjero;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vMaestriasXCantParticipTotal').Value:= aPlanilla.MaestriasXCantParticipTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vMaestriasXCantParticipMujeres').Value:= aPlanilla.MaestriasXCantParticipMujeres;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vMaestriasXCantParticipExtranjeros').Value:= aPlanilla.MaestriasXCantParticipExtranjeros;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vMaestriasXCantParticipProfTC').Value:= aPlanilla.MaestriasXCantParticipProfTC;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vMaestriasXCantParticipProfTP').Value:= aPlanilla.MaestriasXCantParticipProfTP;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vMaestriasXCantParticipUnivMun').Value:= aPlanilla.MaestriasXCantParticipUnivMun;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vMaestriasXCantParticipADistancia').Value:= aPlanilla.MaestriasXCantParticipADistancia;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vMaestriasXCantGradTotal').Value:= aPlanilla.MaestriasXCantGradTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vMaestriasXCantGradMujeres').Value:= aPlanilla.MaestriasXCantGradMujeres;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vMaestriasXCantGradExtranjeros').Value:= aPlanilla.MaestriasXCantGradExtranjeros;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vMaestriasXCantGradProfTC').Value:= aPlanilla.MaestriasXCantGradProfTC;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vMaestriasXCantGradProfTP').Value:= aPlanilla.MaestriasXCantGradProfTP;

  //SubTotal III
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal3XCantActivTotal').Value:= aPlanilla.SubTotal3XCantActivTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal3XCantActivUnivMun').Value:= aPlanilla.SubTotal3XCantActivUnivMun;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal3XCantActivADistancia').Value:= aPlanilla.SubTotal3XCantActivADistancia;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal3XCantActivExtranjero').Value:= aPlanilla.SubTotal3XCantActivExtranjero;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal3XCantParticipTotal').Value:= aPlanilla.SubTotal3XCantParticipTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal3XCantParticipMujeres').Value:= aPlanilla.SubTotal3XCantParticipMujeres;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal3XCantParticipExtranjeros').Value:= aPlanilla.SubTotal3XCantParticipExtranjeros;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal3XCantParticipProfTC').Value:= aPlanilla.SubTotal3XCantParticipProfTC;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal3XCantParticipProfTP').Value:= aPlanilla.SubTotal3XCantParticipProfTP;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal3XCantParticipUnivMun').Value:= aPlanilla.SubTotal3XCantParticipUnivMun;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal3XCantParticipADistancia').Value:= aPlanilla.SubTotal3XCantParticipADistancia;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal3XCantGradTotal').Value:= aPlanilla.SubTotal3XCantGradTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal3XCantGradMujeres').Value:= aPlanilla.SubTotal3XCantGradMujeres;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal3XCantGradExtranjeros').Value:= aPlanilla.SubTotal3XCantGradExtranjeros;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal3XCantGradProfTC').Value:= aPlanilla.SubTotal3XCantGradProfTC;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vSubTotal3XCantGradProfTP').Value:= aPlanilla.SubTotal3XCantGradProfTP;


  //Total
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vTotalXCantActivTotal').Value:= aPlanilla.TotalXCantActivTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vTotalXCantActivUnivMun').Value:= aPlanilla.TotalXCantActivUnivMun;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vTotalXCantActivADistancia').Value:= aPlanilla.TotalXCantActivADistancia;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vTotalXCantActivExtranjero').Value:= aPlanilla.TotalXCantActivExtranjero;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vTotalXCantParticipTotal').Value:= aPlanilla.TotalXCantParticipTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vTotalXCantParticipMujeres').Value:= aPlanilla.TotalXCantParticipMujeres;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vTotalXCantParticipExtranjeros').Value:= aPlanilla.TotalXCantParticipExtranjeros;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vTotalXCantParticipProfTC').Value:= aPlanilla.TotalXCantParticipProfTC;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vTotalXCantParticipProfTP').Value:= aPlanilla.TotalXCantParticipProfTP;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vTotalXCantParticipUnivMun').Value:= aPlanilla.TotalXCantParticipUnivMun;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vTotalXCantParticipADistancia').Value:= aPlanilla.TotalXCantParticipADistancia;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vTotalXCantGradTotal').Value:= aPlanilla.TotalXCantGradTotal;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vTotalXCantGradMujeres').Value:= aPlanilla.TotalXCantGradMujeres;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vTotalXCantGradExtranjeros').Value:= aPlanilla.TotalXCantGradExtranjeros;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vTotalXCantGradProfTC').Value:= aPlanilla.TotalXCantGradProfTC;
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Parameters.ParamByName('@vTotalXCantGradProfTP').Value:= aPlanilla.TotalXCantGradProfTP;

  //Aqu� se hace la inserci�n de datos, en la BD
  //DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.Open; //<- NO Genera datos de respuesta el StoredProc, por eso se oculta esto.
  DataModuleInformes.spModificarPlanilla1164_01PorID_Planilla.ExecProc;
end;



procedure TModuloInformes.MostrarMunicipiosParaPlanilla1164_01PorNombreProvincia(aNombreProvincia: AnsiString);
begin
  //Se realiza la conexi�n con la BD
  DataModuleConexionGeneral.ADOConnectionGeneral.Connected:= True;
  DataModuleInformes.spSelecMunicipiosParaPlanilla1164_01PorNombreProvincia.Active:= False;

  //*** Le pasamos el par�metro al StoredProc. ***
  DataModuleInformes.spSelecMunicipiosParaPlanilla1164_01PorNombreProvincia.Parameters.ParamByName('@vNombreProvincia').Value:= aNombreProvincia;

  //Aqu� se hace la busqueda de datos, en la BD
  DataModuleInformes.spSelecMunicipiosParaPlanilla1164_01PorNombreProvincia.Open; //<- S� genera datos de respuesta el StoredProc, por eso se muestra esto.
  DataModuleInformes.spSelecMunicipiosParaPlanilla1164_01PorNombreProvincia.ExecProc;
end;



procedure TModuloInformes.MostrarPlanillas1164_01PorAnno(aAnno: Integer);
begin
  //Se realiza la conexi�n con la BD
  DataModuleConexionGeneral.ADOConnectionGeneral.Connected:= True;
  DataModuleInformes.spSelecPlanillas1164_01PorAnno.Active:= False;

  //*** Le pasamos el par�metro al StoredProc. ***
  DataModuleInformes.spSelecPlanillas1164_01PorAnno.Parameters.ParamByName('@vAnno').Value:= aAnno;

  //Aqu� se hace la busqueda de datos, en la BD
  DataModuleInformes.spSelecPlanillas1164_01PorAnno.Open; //<- S� genera datos de respuesta el StoredProc, por eso se muestra esto.
  DataModuleInformes.spSelecPlanillas1164_01PorAnno.ExecProc;
end;



procedure TModuloInformes.MostrarPlanillas1164_01PorProvincia(aProvincia: AnsiString);
begin
  //Se realiza la conexi�n con la BD
  DataModuleConexionGeneral.ADOConnectionGeneral.Connected:= True;
  DataModuleInformes.spSelecPlanillas1164_01PorProvincia.Active:= False;

  //*** Le pasamos el par�metro al StoredProc. ***
  DataModuleInformes.spSelecPlanillas1164_01PorProvincia.Parameters.ParamByName('@vProvincia').Value:= aProvincia;

  //Aqu� se hace la busqueda de datos, en la BD
  DataModuleInformes.spSelecPlanillas1164_01PorProvincia.Open; //<- S� genera datos de respuesta el StoredProc, por eso se muestra esto.
  DataModuleInformes.spSelecPlanillas1164_01PorProvincia.ExecProc;
end;



procedure TModuloInformes.MostrarPlanillas1164_01PorProvinciaYAnno(aProvincia: AnsiString; aAnno: Integer);
begin
  //Se realiza la conexi�n con la BD
  DataModuleConexionGeneral.ADOConnectionGeneral.Connected:= True;
  DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno.Active:= False;

  //*** Le pasamos el par�metro al StoredProc. ***
  DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno.Parameters.ParamByName('@vProvincia').Value:= aProvincia;
  DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno.Parameters.ParamByName('@vAnno').Value:= aAnno;

  //Aqu� se hace la busqueda de datos, en la BD
  DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno.Open; //<- S� genera datos de respuesta el StoredProc, por eso se muestra esto.
  DataModuleInformes.spSelecPlanillas1164_01PorProvinciaYAnno.ExecProc;
end;



procedure TModuloInformes.MostrarPlanillas1164_01Todas;
begin
  //Se realiza la conexi�n con la BD
  DataModuleConexionGeneral.ADOConnectionGeneral.Connected:= True;
  DataModuleInformes.spSelecPlanillas1164_01Todas.Active:= False;

  //*** No hay que pasarle par�metro alguno al StoredProc ***


  //Aqu� se hace la busqueda de datos, en la BD
  DataModuleInformes.spSelecPlanillas1164_01Todas.Open; //<- S� genera datos de respuesta el StoredProc, por eso se muestra esto.
  DataModuleInformes.spSelecPlanillas1164_01Todas.ExecProc;
end;



procedure TModuloInformes.MostrarSumatoriaPlanillas1164_01PorAnno(aAnno: Integer);
begin
  //Se realiza la conexi�n con la BD
  DataModuleConexionGeneral.ADOConnectionGeneral.Connected:= True;
  DataModuleInformes.spSelecSumatoriaPlanillas1164_01PorAnno.Active:= False;

  //*** Le pasamos el par�metro al StoredProc. ***
  DataModuleInformes.spSelecSumatoriaPlanillas1164_01PorAnno.Parameters.ParamByName('@vAnno').Value:= aAnno;

  //Aqu� se hace la busqueda de datos, en la BD
  DataModuleInformes.spSelecSumatoriaPlanillas1164_01PorAnno.Open; //<- S� genera datos de respuesta el StoredProc, por eso se muestra esto.
  DataModuleInformes.spSelecSumatoriaPlanillas1164_01PorAnno.ExecProc;
end;



end.
