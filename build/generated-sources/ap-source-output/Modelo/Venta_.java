package Modelo;

import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-10-30T20:01:25")
@StaticMetamodel(Venta.class)
public class Venta_ { 

    public static volatile SingularAttribute<Venta, Date> fecha;
    public static volatile SingularAttribute<Venta, BigDecimal> total;
    public static volatile SingularAttribute<Venta, Integer> idUsuario;
    public static volatile SingularAttribute<Venta, Integer> idCasa;
    public static volatile SingularAttribute<Venta, Integer> id;

}