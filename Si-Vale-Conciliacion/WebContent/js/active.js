var target = -1;
switch( window.location.pathname )
{
    case "/Si-Vale-Conciliacion/resumenAction.action":
    case "/Si-Vale-Conciliacion/userLogin":
        target = 0;        
        break;
        
    case "/Si-Vale-Conciliacion/transaccionesAction.action":
    case "/Si-Vale-Conciliacion/facturasAction.action":
        target = 1;
        break;

    case "/Si-Vale-Conciliacion/justificantesAction.action":
        target = 2;
        break;
        
    case "/Si-Vale-Conciliacion/reportesAction.action":
        target = 3;
        break;
        
    case "/Si-Vale-Conciliacion/configuracionAction.action":
        target = 4;
        break;        
        
    /* add other cases */
}

$($(".nav-sidebar li")[target]).addClass("active");

