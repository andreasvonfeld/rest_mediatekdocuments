<?php
include_once("AccessBDD.php");

/**
 * Classe de construction des requêtes SQL
 * hérite de AccessBDD qui contient les requêtes de base
 * Pour ajouter une requête :
 * - créer la fonction qui crée une requête (prendre modèle sur les fonctions 
 *   existantes qui ne commencent pas par 'traitement')
 * - ajouter un 'case' dans un des switch des fonctions redéfinies 
 * - appeler la nouvelle fonction dans ce 'case'
 */
class MyAccessBDD extends AccessBDD {
	    
    /**
     * constructeur qui appelle celui de la classe mère
     */
    public function __construct(){
        try{
            parent::__construct();
        }catch(\Exception $e){
            throw $e;
        }
    }

    /**
     * demande de recherche
     * @param string $table
     * @param array|null $champs nom et valeur de chaque champ
     * @return array|null tuples du résultat de la requête ou null si erreur
     * @override
     */	
    protected function traitementSelect(string $table, ?array $champs) : ?array{
        switch($table){  
            case "livre" :
                return $this->selectAllLivres();
            case "dvd" :
                return $this->selectAllDvd();
            case "revue" :
                return $this->selectAllRevues();
            case "exemplaire" :
                return $this->selectExemplairesRevue($champs);
            case "commandedocument/livre" :
                return $this->selectCommandesLivres();    
            case "commandedocument/dvd" :
                return $this->selectCommandesDvd();    
            case "genre" :
            case "public" :
            case "rayon" :
            case "etat" :
                // select portant sur une table contenant juste id et libelle
                return $this->selectTableSimple($table, $champs);
            case "" :
                // return $this->uneFonction(parametres);
            default:
                // cas général
                return $this->selectTuplesOneTable($table, $champs);
        }	
    }

    /**
     * demande d'ajout (insert)
     * @param string $table
     * @param array|null $champs nom et valeur de chaque champ
     * @return int|null nombre de tuples ajoutés ou null si erreur
     * @override
     */	
    protected function traitementInsert(string $table, ?array $champs) : ?int{
        switch($table){
            case "document" :
                return $this->insertDocument($champs); // Ajout d'un document
            default:                    
                // cas général
                return $this->insertOneTupleOneTable($table, $champs);	
        }
    }
    
    /**
 * Insère un document dans la table "document"
 * @param array|null $champs
 * @return int|null ID du document inséré ou null en cas d'erreur
 */
private function insertDocument(?array $champs): ?int {
    file_put_contents("log_insertDocument.txt", file_get_contents("php://input") . "\n", FILE_APPEND);
    if (empty($champs)) {
        return null;
    }

    if (!isset($champs['titre'])) {
        return null; // Vérifie que les champs obligatoires sont bien présents
    }

    // Création de la requête SQL d'insertion
    $requete = "INSERT INTO document (id, titre, idRayon, idPublic, idGenre, image) 
                VALUES (:id, :titre, :idRayon, :idPublic, :idGenre, :image)";

    file_put_contents("log_insertDocument.txt", "Exécution de la requête SQL : " . $requete . "\nDonnées utilisées : " . json_encode($champs) . "\n", FILE_APPEND);
    $result = $this->conn->updateBDD($requete, $champs);
    file_put_contents("log_insertDocument.txt", "Résultat de l'insertion : " . ($result ? "SUCCÈS" : "ÉCHEC") . "\n", FILE_APPEND);


    return $result ? $champs['id'] : null; // Retourne l'ID inséré ou null si échec
}

    

    /**
     * demande de modification (update)
     * @param string $table
     * @param string|null $id
     * @param array|null $champs nom et valeur de chaque champ
     * @return int|null nombre de tuples modifiés ou null si erreur
     * @override
     */	
    protected function traitementUpdate(string $table, ?string $id, ?array $champs) : ?int{
        file_put_contents("log_etat.txt", "🔎 traitementUpdate reçu → table: $table | id: $id | champs: " . json_encode($champs) . "\n", FILE_APPEND);

        // Pour les updates par numéro (exemplaire)
    if ($table === "exemplaire" && $id === "numero" && isset($champs["numero"])) {
        return $this->updateExemplaireParNumero($champs);
    }

    // Cas général
    return $this->updateOneTupleOneTable($table, $id, $champs);	
    }  
    
    private function updateExemplaireParNumero($champs) {
    if (!isset($champs['idEtat']) || !isset($champs['numero'])) {
        file_put_contents("log_etat.txt", "❌ Champs manquants pour updateExemplaireParNumero\n", FILE_APPEND);
        return false;
    }

    file_put_contents("log_etat.txt", "🔧 Requête update par numéro → " . json_encode($champs) . "\n", FILE_APPEND);

    $requete = "UPDATE exemplaire SET idEtat = :idEtat WHERE numero = :numero";
    file_put_contents("log_etat.txt", "📌 SQL = $requete\n", FILE_APPEND);

    return $this->conn->updateBDD($requete, $champs);
}


    
    /**
     * demande de suppression (delete)
     * @param string $table
     * @param array|null $champs nom et valeur de chaque champ
     * @return int|null nombre de tuples supprimés ou null si erreur
     * @override
     */	
    protected function traitementDelete(string $table, ?array $champs) : ?int{
        switch($table){
            case "" :
                // return $this->uneFonction(parametres);
            default:                    
                // cas général
                return $this->deleteTuplesOneTable($table, $champs);	
        }
    }	    
        
    /**
     * récupère les tuples d'une seule table
     * @param string $table
     * @param array|null $champs
     * @return array|null 
     */
    private function selectTuplesOneTable(string $table, ?array $champs) : ?array{
        if(empty($champs)){
            // tous les tuples d'une table
            $requete = "select * from $table;";           
            return $this->conn->queryBDD($requete);  
        }else{
            // tuples spécifiques d'une table
            $requete = "select * from $table where ";
            foreach ($champs as $key => $value){
                $requete .= "$key=:$key and ";
            }
            $requete = substr($requete, 0, strlen($requete)-5);	         
            return $this->conn->queryBDD($requete, $champs);
        }
    }	

    /**
     * demande d'ajout (insert) d'un tuple dans une table
     * @param string $table
     * @param array|null $champs
     * @return int|null nombre de tuples ajoutés (0 ou 1) ou null si erreur
     */	
    private function insertOneTupleOneTable(string $table, ?array $champs) : ?int{
        if(empty($champs)){
            return null;
        }
        // construction de la requête
        $requete = "insert into $table (";
        foreach ($champs as $key => $value){
            $requete .= "$key,";
        }
        // (enlève la dernière virgule)
        $requete = substr($requete, 0, strlen($requete)-1);
        $requete .= ") values (";
        foreach ($champs as $key => $value){
            $requete .= ":$key,";
        }
        // (enlève la dernière virgule)
        $requete = substr($requete, 0, strlen($requete)-1);
        $requete .= ");";
        return $this->conn->updateBDD($requete, $champs);
    }

    /**
     * demande de modification (update) d'un tuple dans une table
     * @param string $table
     * @param string\null $id
     * @param array|null $champs 
     * @return int|null nombre de tuples modifiés (0 ou 1) ou null si erreur
     */	
    private function updateOneTupleOneTable(string $table, ?string $id, ?array $champs) : ?int {            
        if(empty($champs)){
            return null;
        }
        if(is_null($id)){
            return null;
        }
        // construction de la requête
        $requete = "update $table set ";
        foreach ($champs as $key => $value){
            $requete .= "$key=:$key,";
        }
        // (enlève la dernière virgule)
        $requete = substr($requete, 0, strlen($requete)-1);				
        $champs["id"] = $id;
        $requete .= " where id=:id;";	
        return $this->conn->updateBDD($requete, $champs);
        
    }
    
    /**
     * demande de suppression (delete) d'un ou plusieurs tuples dans une table
     * @param string $table
     * @param array|null $champs
     * @return int|null nombre de tuples supprimés ou null si erreur
     */
    private function deleteTuplesOneTable(string $table, ?array $champs) : ?int{
        if(empty($champs)){
            return null;
        }
        // construction de la requête
        $requete = "delete from $table where ";
        foreach ($champs as $key => $value){
            $requete .= "$key=:$key and ";
        }
        // (enlève le dernier and)
        $requete = substr($requete, 0, strlen($requete)-5);   
        return $this->conn->updateBDD($requete, $champs);	        
    }
 
    /**
    * Récupère toutes les lignes d'une table simple ou un seul élément filtré par libelle
    * @param string $table
    * @param array|null $champs
    * @return array|null
    */
    private function selectTableSimple(string $table, ?array $champs = null) : ?array{
        $requete = "SELECT * FROM $table ORDER BY libelle;";
        return $this->conn->queryBDD($requete);	 	    
    }
    
    /**
     * récupère toutes les lignes de la table Livre et les tables associées
     * @return array|null
     */
    private function selectAllLivres() : ?array{
        $columns = "l.id, l.ISBN, l.auteur, d.titre, d.image, l.collection, 
                d.idrayon, d.idpublic, d.idgenre, 
                g.libelle as genre, p.libelle as lePublic, r.libelle as rayon";

        $joins = "from livre l 
              join document d on l.id = d.id 
              join genre g on g.id = d.idGenre 
              join public p on p.id = d.idPublic 
              join rayon r on r.id = d.idRayon";

        $requete = "SELECT $columns $joins ORDER BY d.titre"; 

        return $this->conn->queryBDD($requete);
    }	

    /**
     * récupère toutes les lignes de la table DVD et les tables associées
     * @return array|null
     */
    private function selectAllDvd() : ?array{
        $requete = "Select l.id, l.duree, l.realisateur, d.titre, d.image, l.synopsis, ";
        $requete .= "d.idrayon, d.idpublic, d.idgenre, g.libelle as genre, p.libelle as lePublic, r.libelle as rayon ";
        $requete .= "from dvd l join document d on l.id=d.id ";
        $requete .= "join genre g on g.id=d.idGenre ";
        $requete .= "join public p on p.id=d.idPublic ";
        $requete .= "join rayon r on r.id=d.idRayon ";
        $requete .= "order by titre ";	
        return $this->conn->queryBDD($requete);
    }	

    /**
     * récupère toutes les lignes de la table Revue et les tables associées
     * @return array|null
     */
    private function selectAllRevues() : ?array{
        $requete = "Select l.id, l.periodicite, d.titre, d.image, l.delaiMiseADispo, ";
        $requete .= "d.idrayon, d.idpublic, d.idgenre, g.libelle as genre, p.libelle as lePublic, r.libelle as rayon ";
        $requete .= "from revue l join document d on l.id=d.id ";
        $requete .= "join genre g on g.id=d.idGenre ";
        $requete .= "join public p on p.id=d.idPublic ";
        $requete .= "join rayon r on r.id=d.idRayon ";
        $requete .= "order by titre ";
        return $this->conn->queryBDD($requete);
    }	

    /**
     * récupère tous les exemplaires d'une revue
     * @param array|null $champs 
     * @return array|null
     */
    private function selectExemplairesRevue(?array $champs) : ?array {
    if (empty($champs)) {
        file_put_contents("log_debug.txt", "❌ ERREUR : Champs vide dans selectExemplairesRevue !\n", FILE_APPEND);
        return null;
    }
    
    if (!array_key_exists('id', $champs)) {
        file_put_contents("log_debug.txt", "❌ ERREUR : Clé 'id' manquante dans selectExemplairesRevue !\n", FILE_APPEND);
        return null;
    }

    $champNecessaire['id'] = $champs['id'];

    // Log ID reçu
    file_put_contents("log_debug.txt", "🔍 ID Reçu : " . $champNecessaire['id'] . "\n", FILE_APPEND);

    $requete = "SELECT e.id, e.numero, e.dateAchat, e.photo, e.idEtat ";
    $requete .= "FROM exemplaire e JOIN document d ON e.id = d.id ";
    $requete .= "WHERE e.id = :id ";
    $requete .= "ORDER BY e.dateAchat DESC";

    // Log de la requête SQL exécutée
    file_put_contents("log_debug.txt", "📌 Requête SQL : " . $requete . "\nDonnées utilisées : " . json_encode($champNecessaire) . "\n", FILE_APPEND);

    // Exécution de la requête
    $result = $this->conn->queryBDD($requete, $champNecessaire);

    // Log du résultat obtenu
    if ($result) {
        file_put_contents("log_debug.txt", "✅ Résultat trouvé : " . json_encode($result) . "\n", FILE_APPEND);
    } else {
        file_put_contents("log_debug.txt", "⚠️ Aucun résultat trouvé !\n", FILE_APPEND);
    }

    return $result;
}

    
    /**
 * Récupère uniquement les commandes qui concernent des livres
 * @return array|null
 */
private function selectCommandesLivres() : ?array {
    $requete = "SELECT cd.*
                FROM commandedocument cd
                JOIN livres_dvd ld ON cd.idLivreDvd = ld.id
                JOIN livre l ON ld.id = l.id";
    
    return $this->conn->queryBDD($requete);
}

    /**
 * Récupère uniquement les commandes qui concernent des livres
 * @return array|null
 */
private function selectCommandesDvd() : ?array {
    $requete = "SELECT cd.*
                FROM commandedocument cd
                JOIN livres_dvd ld ON cd.idLivreDvd = ld.id
                JOIN dvd d ON ld.id = d.id";

    
    return $this->conn->queryBDD($requete);
}

    
    
}
