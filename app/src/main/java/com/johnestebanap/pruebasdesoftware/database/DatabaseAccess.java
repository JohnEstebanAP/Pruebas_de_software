package com.johnestebanap.pruebasdesoftware.database;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class DatabaseAccess {
    private SQLiteOpenHelper openHelper;
    private SQLiteDatabase db;
    private static DatabaseAccess instance;
    Cursor c = null;
    //***********************************************************************************************//
    //Autor: John Esteban Alvarez Piedrahita
    //Implementamos el Patron Singleton
    //Para garantiza la existencia de una única instancia para la clase de la DatabaseAccess
    //ya que solo queremos tener una sola instancia y no muchas instancias de la base de datos

    //con getInstance retornamos una instancia unica del objeto
    public static DatabaseAccess getInstance(Context context) {
        //verificamos si la instancia es nula
        //si la instancia es nula significa que no se a instanciado aun el objeto y lo tenemos que crear
        if (instance == null) {
            //Creamos la instancia del objeto
            instance = new DatabaseAccess(context);
        }
        return instance;
    }
    //Se Crea un constructor privado para evitar la creación de objetos desde fuera de la clase
     private DatabaseAccess(Context context) {
        this.openHelper = new DatabaseOpenHelper(context);
     }
    //***********************************************************************************************//
    //to open the database
    public void open() {
        this.db = openHelper.getWritableDatabase();
    }

    //closing the database connection
    public void close() {
        if (db != null) {
            this.db.close();
        }
    }


    //consultar cuantos datos hay en total
    public int cantidadAllDatos(String Tabla) {
        c = db.rawQuery("select COUNT(*) FROM "+Tabla+"", null);
        int cantidad = 0;
        while (c.moveToNext()) {
            cantidad = c.getInt(0);
        }
        return cantidad;
    }

    //consultar cuantos ciudades hay en total
    public int cantidadAllCity(String city) {
        c = db.rawQuery(" SELECT COUNT(*) FROM Municipality m  WHERE id_deparment  = (SELECT id FROM Departmen d  WHERE name = '"+city+"')" +
                "    ", new String[]{});
        int cantidad = 0;
        while (c.moveToNext()) {
            cantidad = c.getInt(0);
        }
        return cantidad;
    }

    //Consultar los Datos
    public String[] getDatos(int cantida, String Tabla) {
        c = db.rawQuery("SELECT name FROM "+Tabla+"", new String[]{});
        String[] valores = new String[cantida];
        int i = 0;
        while (c.moveToNext()) {
            String nombres = c.getString(0);
            valores[i] = nombres;
            i++;
        }
        return valores;
    }


    //Consultar los cidades
    public String[] getDatosCity(int cantidaCity, String city) {
        c = db.rawQuery(" SELECT name FROM Municipality m  WHERE id_deparment  = (SELECT id FROM Departmen d  WHERE name = '"+city+"')" +
                "    ", new String[]{});
        String[] valores = new String[cantidaCity];
        int i = 0;
        while (c.moveToNext()) {
            String citys = c.getString(0);
            valores[i] = citys;
            i++;
        }
        return valores;
    }



}
