package com.johnestebanap.pruebasdesoftware

import android.content.DialogInterface
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.print.PrintAttributes
import android.text.Editable
import android.text.InputType
import android.text.TextWatcher
import android.text.method.KeyListener
import android.view.Gravity
import android.view.KeyEvent
import android.view.View
import android.view.ViewGroup
import android.widget.ArrayAdapter
import android.widget.LinearLayout
import android.widget.Toast
import androidx.core.util.PatternsCompat
import androidx.core.view.marginBottom
import androidx.core.widget.addTextChangedListener
import com.google.android.material.dialog.MaterialAlertDialogBuilder
import com.google.android.material.textfield.TextInputEditText
import com.google.android.material.textfield.TextInputLayout
import com.johnestebanap.pruebasdesoftware.database.DatabaseAccess
import kotlinx.android.synthetic.main.activity_register.*
import kotlin.math.absoluteValue

class RegisterActivity : AppCompatActivity() {

    var emptyData: Int = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_register)

        //
        controlFlujoedt()
        //Aplicamos la funcion de auto completado para el editext de Departamentos
        listarPais()
        //Aplicamos la funcion de auto completado para el editext de Departamentos
        ed_pais.addTextChangedListener(object : TextWatcher {
          override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {}
          override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {}

          override fun afterTextChanged(p0: Editable?) {
              if (ed_pais.text.toString().length >= 3) {
                  var nombre = listarStates()
                  //edt_departmen.setText(nombre.get(0).toString() ?: "")
              } else {
                  edt_departmen.setText("")
              }
          }
        })

        //Controlamos los eventos del tecaldo para cuando se preciona enter
        edt_departmen.addTextChangedListener(object : TextWatcher {
            override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {}
            override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {}

            override fun afterTextChanged(p0: Editable?) {
                if (edt_departmen.text.toString().length >= 5) {
                    var nombre = listarCity()
                    if (edt_departmen.text.toString().equals("Antioquia")) {
                        edt_city.setText("Medellin")
                    } else {
                        //edt_city.setText(nombre.get(0).toString() ?: "")
                    }
                } else {
                    edt_city.setText("")
                }
            }

        })

        //Aplicamos la funcion de autoCompletado para el editext de Stado civil
        listarStatusCivil()

        edt_estado_civil.addTextChangedListener(object : TextWatcher {
            override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {}
            override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {

            }

            override fun afterTextChanged(p0: Editable?) {

                if (edt_estado_civil.text.toString().length < 1) {
                    edt_estado_civil.inputType = InputType.TYPE_TEXT_FLAG_AUTO_COMPLETE
                    lyt_estado_civil.endIconMode = TextInputLayout.END_ICON_DROPDOWN_MENU
                }
                if (edt_estado_civil.text.toString().length >= 5) {
                    edt_estado_civil.inputType = InputType.TYPE_TEXT_FLAG_AUTO_COMPLETE
                    lyt_estado_civil.endIconMode = TextInputLayout.END_ICON_CLEAR_TEXT
                    edt_telefono.requestFocus()
                }
                edt_estado_civil.keyListener = null
            }

        })


        btn_register.setOnClickListener {
            emptyData = 0
            validacionCamposVacidos()
            //Registro de usuario
            if (emptyData == 0) {
                AlertRegistroexitoso()
                clearDataEdt()
            }
        }
    }

    override fun onBackPressed() {
        close();
    }

    fun controlFlujoedt() {

        ed_pais.setOnKeyListener(View.OnKeyListener { view, keyCode, keyEvent ->
            if (keyCode == KeyEvent.KEYCODE_ENTER) {

                if (!ed_pais.text.toString().isEmpty()) {
                    edt_departmen.requestFocus()
                }
                return@OnKeyListener true
            }
            false
        })

        edt_departmen.setOnKeyListener(View.OnKeyListener { view, keyCode, keyEvent ->
            if (keyCode == KeyEvent.KEYCODE_ENTER) {
                if (!edt_departmen.text.toString().isEmpty()) {
                    edt_city.requestFocus()
                }
                return@OnKeyListener true
            }
            false
        })

        edt_city.setOnKeyListener(View.OnKeyListener { view, keyCode, keyEvent ->
            if (keyCode == KeyEvent.KEYCODE_ENTER) {
                if (!edt_city.text.toString().isEmpty()) {
                    edt_estado_civil.requestFocus()
                }
                return@OnKeyListener true
            }
            false
        })

        edt_estado_civil.setOnKeyListener(View.OnKeyListener { view, keyCode, keyEvent ->
            if (keyCode == KeyEvent.KEYCODE_ENTER) {
                if (!edt_estado_civil.text.toString().isEmpty()) {
                    edt_telefono.requestFocus()
                }
                return@OnKeyListener true
            }
            false
        })


    }

    fun listarPais() {
        val databaseAccess = DatabaseAccess.getInstance(this)
        databaseAccess.open()

        //Autocompletado Departamentos
        var cantidaDatos = databaseAccess.cantidadAllDatos("Countries")
        var nombresDatos = databaseAccess.getDatos(cantidaDatos, "Countries")
        databaseAccess.close()

        var adapterPais =
            ArrayAdapter(this, android.R.layout.select_dialog_item, nombresDatos)
        ed_pais.threshold = 1
        ed_pais.setAdapter(adapterPais)
    }

    fun listarStates(): Array<String> {
        val databaseAccess = DatabaseAccess.getInstance(this)
        databaseAccess.open()

        //Autocompletado ciudad
        var cantidaStates = databaseAccess.cantidadAllWhere("States",  "id_country", "Countries" ,ed_pais.text.toString())
        Toast.makeText(this, "cantiadad departamentos: "+ cantidaStates, Toast.LENGTH_SHORT).show()
        //SE Genera un error si le no validamos si el departamento esta bein escrito y fue encontrado en la base de datos
        //Se soluciona este errror validando si la cantidad de departamentos consultados en la base de datos es diferente de 0
        var nombresStates = Array<String>(size = cantidaStates, init = { index -> "" })
        if (cantidaStates != 0) {
            nombresStates = databaseAccess.getDatosWhere( cantidaStates,"States",  "id_country", "Countries" ,ed_pais.text.toString())
        } else {
            nombresStates = Array<String>(size = 1, init = { index -> "" })
        }

        var adapterState = ArrayAdapter(this, android.R.layout.select_dialog_item, nombresStates)
        edt_departmen.threshold = 1
        edt_departmen.setAdapter(adapterState)
        databaseAccess.close()

        return nombresStates
    }

    fun listarStatusCivil() {
        val databaseAccess = DatabaseAccess.getInstance(this)
        databaseAccess.open()

        //Autocompletado estado civil
        val cantida = databaseAccess.cantidadAllDatos("Statuscivil")
        val nombresDepartmens = databaseAccess.getDatos(cantida, "Statuscivil")
        databaseAccess.close()

        val adapterStatus =
            ArrayAdapter(this, android.R.layout.select_dialog_item, nombresDepartmens)
        edt_estado_civil.keyListener = null
        edt_estado_civil.threshold = 0
        edt_estado_civil.setAdapter(adapterStatus)
    }

    fun listarCity(): Array<String> {
        val databaseAccess = DatabaseAccess.getInstance(this)
        databaseAccess.open()

        //Autocompletado ciudad
        var cantidaCity = databaseAccess.cantidadAllWhere("cities",  "id_state", "States" ,edt_departmen.text.toString())

        //SE Genera un error si le no validamos si el departamento esta bein escrito y fue encontrado en la base de datos
        //Se soluciona este errror validando si la cantidad de departamentos consultados en la base de datos es diferente de 0
        var nombresCity = Array<String>(size = cantidaCity, init = { index -> "" })
        if (cantidaCity != 0) {
            nombresCity = databaseAccess.getDatosWhere( cantidaCity,"cities",  "id_state", "States" ,edt_departmen.text.toString())
        } else {
            nombresCity = Array<String>(size = 1, init = { index -> "" })
        }

        var adapterCity = ArrayAdapter(this, android.R.layout.select_dialog_item, nombresCity)
        edt_city.threshold = 1
        edt_city.setAdapter(adapterCity)
        databaseAccess.close()

        return nombresCity
    }


    fun validacionCamposVacidos() {
        //Validaciones del Correo Electronico
        val correo = edt_correo.text.toString()
        if (correo.isEmpty()) {
            lyt_correo.error = "Por Favor Ingrese el Correo"
            edt_correo.height = 5
            edt_correo.setPaddingRelative(20, 7, 7, -7)
            emptyData++

        } else if (!PatternsCompat.EMAIL_ADDRESS.matcher(correo).matches()) {
            //se verifica qeuse aya escrito un correo electronico valido
            lyt_correo.error = "Por Favor Ingrese un Correo valido"
            edt_correo.height = 5
            edt_correo.setPaddingRelative(20, 7, 7, -7)
            emptyData++
        } else {
            edt_correo.setPaddingRelative(20, 7, 7, 7)
            edt_correo.height = 35
            lyt_correo.error = null
            lyt_correo.isErrorEnabled = false
        }

        //Validaciones del Nombre
        if (edt_name1.text.toString().isEmpty()) {
            lyt_name1.error = "Ingrese el Nombre completo"
            edt_name1.height = 5
            edt_name1.setPaddingRelative(20, 7, 7, -7)
            emptyData++
        } else {
            edt_name1.setPaddingRelative(20, 7, 7, 7)
            edt_name1.height = 35
            lyt_name1.error = null
            lyt_name1.isErrorEnabled = false
        }

        //Validaciones del Apellido
        if (edt_apellido.text.toString().isEmpty()) {
            lyt_apellido.error = "Ingrese el Apellido completo"
            edt_apellido.height = 5
            edt_apellido.setPaddingRelative(20, 7, 7, -7)
            emptyData++
        } else {
            edt_apellido.setPaddingRelative(20, 7, 7, 7)
            edt_apellido.height = 35
            lyt_apellido.error = null
            lyt_apellido.isErrorEnabled = false
        }

    }

    fun clearDataEdt() {
        edt_correo.setText("")
        edt_name1.setText("")
        edt_apellido.setText("")
        edt_estado_civil.setText("")
        edt_departmen.setText("")
        edt_city.setText("")
        edt_direccion.setText("")
        ed_pais.text.clear()
        edt_telefono.text?.clear()
    }

    fun AlertRegistroexitoso() {
        MaterialAlertDialogBuilder(this)
            .setTitle("Felicidades")
            .setMessage("El registro del nuevo Cliente a sido exitoso.")
            .setPositiveButton("Aceptar") { dialog, which -> }
            .show()
    }

    fun close() {
        MaterialAlertDialogBuilder(this)
            .setTitle("Aviso")
            .setMessage("¿Deseas salir de la aplicación?")
            .setPositiveButton("Salir") { dialog, which -> finishAndRemoveTask() }
            .setNegativeButton("Canselar") { dialog, which -> dialog.cancel() }
            .show()

    }
}
