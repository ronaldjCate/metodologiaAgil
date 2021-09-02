package gui;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;

import javax.swing.JButton;
import javax.swing.JDesktopPane;
import javax.swing.JFrame;
import javax.swing.JMenuBar;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;

public class FromPrincipalDocente extends JFrame implements ActionListener{

private JFrame frame;
	
	private JPanel contentPane;
	JTextField txtusuariologin;
	JTextField txtcodusuariologin;
	JTextField txtnombrelogin;
	JTextField txtidtbpersona;
	private JMenuBar menuBar;
	private JDesktopPane desktopPane;
	
	JTextField txtidtbacceso;
	private JButton btnConsultaHorarios;
	private JButton btnRegistroNotas;
	private JButton btnModificarDatosPersonales;
	private JButton btnSalir;
	

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					FromPrincipalDocente frame = new FromPrincipalDocente();
					frame.setExtendedState(JFrame.MAXIMIZED_BOTH);
					frame.setVisible(true);	
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public FromPrincipalDocente() {
		setIconImage(Toolkit.getDefaultToolkit().getImage(FromPrincipalDocente.class.getResource("/imagenes/upc.png")));
		
		getContentPane().setLayout(null);
		setTitle("UNIVERSIDAD PERUANA DE CIENCIAS APLICADAS ® >>> SISTEMA DE CONTROL DE MATRICULA ® >>> DOCENTE");
		//setIconImage(new ImageIcon("imagenes/loginiacm.jpg").getImage());
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(new BorderLayout(0,0));
		setContentPane(contentPane);
		
		try{
			desktopPane = new JDesktopPane(){
			Image img = javax.imageio.ImageIO.read(
					 new java.net.URL(getClass().getResource("/imagenes/fondo.JPG"),"fondo.JPG"));
			  public void paintComponent(Graphics g){
				  super.paintComponent(g);
				  if(img != null) g.drawImage(img, 0, 0, this.getWidth(), this.getHeight(), this);
				  else g.drawString("Image not found", 100, 100);	  
			     }
			};
			}
			catch(IOException e){
				 e.printStackTrace();
			}
			
			contentPane.add(desktopPane, BorderLayout.CENTER);
			desktopPane.setLayout(null);
			
			btnConsultaHorarios = new JButton("Horarios");
			btnConsultaHorarios.setForeground(Color.RED);
			btnConsultaHorarios.setBackground(Color.WHITE);
			btnConsultaHorarios.setBounds(0, -1, 248, 76);
			desktopPane.add(btnConsultaHorarios);
			
			btnRegistroNotas = new JButton("Registro de Notas");
			btnRegistroNotas.setForeground(Color.RED);
			btnRegistroNotas.setBackground(Color.WHITE);
			btnRegistroNotas.setBounds(0, 71, 248, 76);
			desktopPane.add(btnRegistroNotas);
			
			btnModificarDatosPersonales = new JButton("Datos Personales");
			btnModificarDatosPersonales.setForeground(Color.RED);
			btnModificarDatosPersonales.setBackground(Color.WHITE);
			btnModificarDatosPersonales.setBounds(0, 147, 248, 76);
			desktopPane.add(btnModificarDatosPersonales);
			
			btnSalir = new JButton("Salir");
			btnSalir.addActionListener(this);
			btnSalir.setForeground(Color.RED);
			btnSalir.setBackground(Color.WHITE);
			btnSalir.setBounds(0, 223, 248, 76);
			desktopPane.add(btnSalir);
		
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 896, 507);
		
		
		menuBar = new JMenuBar();
		setJMenuBar(menuBar);
	}

	@Override
	public void actionPerformed(ActionEvent arg0) {
		// TODO Auto-generated method stub
		if(arg0.getSource()==btnSalir){
			actionperformedbtnSalir();
		}
	}

	private void actionperformedbtnSalir() {
		// TODO Auto-generated method stub
		dispose();
		Login l = new Login();
		l.setVisible(true);
	}

}
