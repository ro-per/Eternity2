import java.io.*;
import java.util.*;

public class Convert_txt_to_dzn {
    static class Info {
        int width = 0;
        int height = 0;
        int[][] matrix = new int[1][1];

        @java.lang.Override
        public java.lang.String toString() {
            return "Info{" +
                    "width=" + width +
                    ", height=" + height +
                    ", matrix=" + java.util.Arrays.toString(matrix) +
                    '}';
        }
    }

    public static void main(String[] args) {
        //READ IN SIZES
        String sizes = args[0];
        // DEFINE FILES
        File txt_file = new File("../pieces1_txt/pieces_" + sizes + ".txt");
        File dzn_file = new File("../pieces1_dzn/pieces_" + sizes + ".dzn");
        //if (!dzn_file.createNewFile()) System.out.println("File created overwriting");

        //READ IN TXT
        Info info = read_in_txt(txt_file);
        //WRITE TO DZN
        write_to_dzn(info, dzn_file);


    }

    public static Info read_in_txt(File txt_file) {
        Info info = new Info();
        try {
            Scanner sc = new Scanner(txt_file);
            String[] arr = sc.nextLine().split(" ");
            //SAVE WIDTH AND HEIGHT
            info.width = Integer.parseInt(arr[0]);
            info.height = Integer.parseInt(arr[1]);
            //INIT MATRIX
            info.matrix = new int[info.height * info.width][4];

            int count = 0;
            while (sc.hasNextLine()) {
                String[] data = sc.nextLine().split(" ");
                for (int i = 0; i < 4; i++) {
                    info.matrix[count][i] = Integer.parseInt(data[i]);
                }
                count++;
            }
            sc.close();
        } catch (Exception e) {
            System.out.println("An error while reading occurred.");
            e.printStackTrace();
        }
        return info;
    }

    public static void write_to_dzn(Info info, File dzn_file) {

        try {

            StringBuilder sb = new StringBuilder();
            sb.append("H= " + info.height + ";\n");
            sb.append("W= " + info.width + ";\n");
            sb.append("Pieces = \n [");

            for (int i = 0; i < info.matrix.length; i++) {
                if (i != 0) {
                    sb.append("\n");
                }
                sb.append("|");
                for (int j = 0; j < info.matrix[i].length; j++) {
                    sb.append(info.matrix[i][j] + ",");
                }
            }

            sb.append("|]; \n");

            FileWriter fw = new FileWriter(dzn_file);
            fw.write(sb.toString());
            fw.close();

        } catch (Exception e) {
            System.out.println("An error while writing occurred.");
            e.printStackTrace();
        }
    }
}
