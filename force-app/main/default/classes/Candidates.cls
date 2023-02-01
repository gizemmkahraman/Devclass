public class Candidates {
   public string name;
   public string gender;
   public static integer countCandidates = 0;
   public static string companyName;

   public void printCandidate(){
    system.debug('------Start------');
    system.debug('Candidate name is ' + name + ' , gender is ' + gender);
    system.debug('Company name is ' + companyName); 
    system.debug('------End-----');
   }

   public static void printCompany(){
      system.debug('company   name is ' +companyName);
      //we cannot access NON-static members inside the static.
      //system.debug('name of candidate => ' + name);
   }
}