import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
public class ResServlet extends HttpServlet {
    // ���[�U�[���̎������i�[����C���X�^���X�ϐ�
    private String _userName;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        // �o�͂�����e�̃f�[�^�E�^�C�v�ƕ����R�[�h���w�肷��
        res.setContentType("text/html; charset=Windows-31J");
        // HttpResponse�C���^�[�t�F�C�X����������N���X�̃C���X�^���X����
        // PrintWriter�̃T�u�N���X�̃C���X�^���X���擾����
        // PrintWriter out = res.getWriter();
        // // �ȉ���������o�͂���
        // out.println("<html>");
        // out.println("<head>");
        // out.println("<title>�����̊m�F</title>");
        // out.println("</head>");
        // out.println("<body>");
        // out.println("<p>�����̊m�F��" + _userName + "</p>");
        // out.println("</body>");
        // out.println("</html>");
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // �N���C�A���g�����request�Ɋ܂܂�Ă����f�[�^��
        // �����R�[�h���w�肷��
        req.setCharacterEncoding("Windows-31J");
        // �N���C�A���g�����request�̃��b�Z�[�W�{�f�B��
        // �܂܂�Ă����f�[�^�����o��
        // �G���R�[�h����Ă����f�[�^�́A
        // �����Ńf�R�[�h�i�������j����Ď��o�����B
        // String n = req.getParameter("txt");
        // // �C���X�^���X�ϐ��Ɋi�[����
        // _userName = n;
        // String[] values = req.getParameterValues("chk");
        // // �o�͂�����e�̃f�[�^�E�^�C�v�ƕ����R�[�h���w�肷��
        // resp.setContentType("text/html; charset=Windows-31J");
        // // HttpResponse�C���^�[�t�F�C�X����������N���X�̃C���X�^���X����
        // // PrintWriter�̃T�u�N���X�̃C���X�^���X���擾����
        // PrintWriter out = resp.getWriter();
        // // �ȉ���������o�͂���
        // out.println("<html>");
        // out.println("<head>");
        // out.println("<title>�����ƑI�����ꂽ�\�t�g�E�F�A</title>");
        // out.println("</head>");
        // out.println("<body>");
        // out.println("<p>������" + n + "</p>");
        // for (int i = 0; i < values.length; i++) {
        //     out.println("<p>�`�F�b�N��" + values[i] + "</p>");
        // }
        // out.println("</body>");
        // out.println("</html>");
    }
}

// javac -cp C:\tomcat8.5\lib\servlet-api.jar ShareServlet.java