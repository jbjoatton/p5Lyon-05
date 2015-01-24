PImage img;
int nbreTypos;

void setup()
{
    size( 700, 1000 );
    img = loadImage( "1g6zo7yl.bmp" );
    img.resize( width, height );

    printArray( PFont.list() );
    nbreTypos = PFont.list().length;
    println( "Nombre de Typos: " + nbreTypos );

    background( 255 );
    noStroke();
    textAlign(CENTER, CENTER);
}

void draw()
{
    if ( mousePressed )
    {
        float distance = dist( mouseX, mouseY, pmouseX, pmouseY );
        choisirUneTypo( distance );

        int nbreRonds = int( random( 1, 10 ) );
        int compteur = 0;
        while ( compteur < nbreRonds )
        {

            int x = int( mouseX + random( -distance, distance ) );
            int y = int( mouseY + random( -distance, distance ) );
            fill( img.get( x, y ), 200 );
            //ellipse( x, y, distance, distance );
            text( char( 65  + int( random( 26 ) ) ), x, y );

            compteur++;
        }
    }
}

void keyPressed()
{
    if ( key == ' ' )
    {
        saveFrame( "export/export_####.png" );
    } else {
        background( 255 );
    }
}

void choisirUneTypo( float taille )
{
    int choix = int( random( nbreTypos ) );
    PFont font = createFont( PFont.list() [ choix ], min( taille, 2 ) );
    textFont(font);
}
