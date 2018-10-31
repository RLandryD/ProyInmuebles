package Modelo;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-10-30T20:01:25")
@StaticMetamodel(Cita.class)
public class Cita_ { 

    public static volatile SingularAttribute<Cita, Date> fecha;
    public static volatile SingularAttribute<Cita, String> motivo;
    public static volatile SingularAttribute<Cita, String> estatus;
    public static volatile SingularAttribute<Cita, Integer> idUsuario;
    public static volatile SingularAttribute<Cita, Integer> idContacto;
    public static volatile SingularAttribute<Cita, Integer> id;
    public static volatile SingularAttribute<Cita, Integer> idPublicacion;

}