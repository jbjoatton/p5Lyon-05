// on déclare nos variables globales

int nbreTypos;

//on déclare une variable permettant de stocker une image
PImage img;

void setup()
{
    size( 700, 1000 );

	// PFont.list() est un tableau contenant le nom de toutes les typos installées sur notre ordinateur
    printArray( PFont.list() );
    
    // on appelle "longueur" d'un tableau, le nombre d'éléments contenus dans ce tableau
    nbreTypos = PFont.list().length;
    println( "Nombre de Typos: " + nbreTypos );
    
    // on charge l'image
    img = loadImage( "1g6zo7yl.bmp" );

    // on redimensionne l'image à la taille du programme
    img.resize( width, height );

    background( 255 );
    noStroke();
    textAlign(CENTER, CENTER);
}

void draw()
{
	//si on appuie sur la souris
    if ( mousePressed == true )
    {

    	// on calcule le déplacement de la souris depuis la frame précédente
        float distance = dist( mouseX, mouseY, pmouseX, pmouseY );

        // on choisit une typo avec comme paramètre de taille, la distance parcourue par la souris
        choisirUneTypo( distance );

        // on définit le nombre de répétitions
        int nbreRepetitions = int( random( 1, 10 ) );

        // on initialise un compteur
        int compteur = 0;
        while ( compteur < nbreRepetitions )
        {
        	// on prend une position aléatoire autour de la souris
            int x = int( mouseX + random( -distance, distance ) );
            int y = int( mouseY + random( -distance, distance ) );
            
            //on récupère la couleur de l'image à cette position
            fill( img.get( x, y ), 200 );

            // ellipse( x, y, distance, distance );

            // on affiche une lettre au hasard grâce à son code ASCII
            text( char( 65  + int( random( 26 ) ) ), x, y );

            //on met à jour notre compteur
            compteur++;
        }
    }
}

void keyPressed()
{
    if ( key == ' ' )
    {
		//si on apuuie sur espace
        saveFrame( "export/export_####.png" );
    } else {
    	// pour toute les autres touches
        background( 255 );
    }
}

void choisirUneTypo( int taille )
{
	// on tire un numéro au hasard
    int choix = int( random( nbreTypos ) );

    // on crée la typo située dans le tableau "PFont.list()" à la case [ choix ], avec la taille passée en paramètre
    PFont font = createFont( PFont.list() [ choix ], constrain( taille, 2, 180 ) );
    textFont(font);
}
