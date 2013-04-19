import java.util.*;

public class prob024{
   public static void main(String[] args){
      ArrayList<Integer> l = new ArrayList<Integer>();
      int lim = 10;
      if(args.length != 0){
         lim = Integer.parseInt(args[0]);
      }
      for(int i = 0 ;i<lim;i++){
         l.add(new Integer(i));
      }

      ArrayList<ArrayList<Integer>> t = perm(l);
      Collections.sort(t, new Comparator<ArrayList<Integer>>(){
         public int compare(ArrayList<Integer> a, ArrayList<Integer> b){
            int comp = 0;
            int i = 0;
            int asize = a.size();
            int bsize = b.size();
            while(comp == 0 && i < asize && i < bsize){
               comp = a.get(i).compareTo(b.get(i));
               i++;
            }
            if(comp != 0){
               return comp;
            }else{ //one list is longer than the other, or they are equivalent
               if(asize > bsize){
                  return -1;
               }else if(bsize > asize){
                  return 1;
               }else return 0;
            }

         }
      });
      //System.out.println(t);
            System.out.println(t.get(999999));

   }

   public static ArrayList<ArrayList<Integer>> perm(ArrayList<Integer> list){

      ArrayList<ArrayList<Integer>> ret = new ArrayList<ArrayList<Integer>>();
      if(list.size() == 1){
         ret.add(new ArrayList<Integer>(list));
         return ret;
      }
      for(Integer i : list){ //pick an integer to "start" the permutation with
         ArrayList<Integer> copy = new ArrayList<Integer>(list);
         copy.remove(i);

         ArrayList<ArrayList<Integer>> next_lists = perm(copy); //generate the permutations of the remaining items 
         for(ArrayList<Integer> tail : next_lists){ //for each possible permutation, add [i|tail]
            ArrayList<Integer> n = new ArrayList<Integer>(tail);
            n.add(i); 
            ret.add(n);
         }

      }
      return ret;
   } 
}
