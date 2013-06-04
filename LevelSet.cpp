ginclude "LevelSet.h"
using namespace std;

LevelSet::LevelSet(){}

LevelSet::~LevelSet(){}

LevelSet::LevelSet(Grid grid):xCells(grid.xCells), yCells(grid.yCells), dX(grid.dX), dY(grid.dY), NX(grid.NX), NY(grid.NY){
	std::vector<std::vector<double> > vec(NX, vector<double>(NY));
	bCs = Grid::bCs;
	nx = vec;
	ny = vec;
	levelSet = vec;
}
//initialize prior to allocating grid vector


void LevelSet::calculateNormals(){
	double phiX, phiY, den;
	for(int i = Grid::bCs; i < xCells + Grid::bCs; i++)	
		for(int j = Grid::bCs; j < yCells + Grid::bCs; j++){
			phiX = (levelSet[i + 1][j] - levelSet[i - 1][j])/(2*dX);
			phiY = (levelSet[i][j + 1] - levelSet[i][j - 1])/(2*dY);
			den = sqrt(pow(phiX, 2) + pow(phiY, 2));	
			nx[i][j] = phiX/den; 
			ny[i][j] = phiY/den; 
		}
	//string outputNormals = "../Output/normals.dat";
	//outputToFile2DArray(nx, outputNormals);
}

void LevelSet::outputToFileLevelSet2D(string fileName){
	ofstream output;		
	output.open(fileName.c_str());
	int bCs = Grid::bCs;
	for(int i = bCs; i < xCells + bCs; i++) {
		for(int j = bCs; j < yCells + bCs; j++)	{			
			output  << (i-bCs)*dX << '\t' << (j-bCs)*dY << '\t' << levelSet[i][j] << endl;				
		}	
		output << endl;
	}
	output.close();	
}
	

void LevelSet::outputLevelSet(string fileName){
	ofstream output;		
	output.open(fileName.c_str());
	for (int i = 0; i < NX; i++){
		for(int j = 0; j < NY; j++)	{
			output << levelSet[i][j] << '\t' ;
		}
		output << endl;		
	}
	output.close();
}




BeamLevelSet::BeamLevelSet(){}
//when initialize must call yGap function on BeamSolver
BeamLevelSet::BeamLevelSet(Grid grid, double xPos, double yPos, BeamSolver* beam, double angle):LevelSet(grid){
	beamX = xPos;
	beamY = yPos;
	theta = angle; 
	beamSolver = beam;
	deflections = beam->getNodeDeflections();
	step = beam->dist(); //this is the constant step between midpoints - x or y direction.
	createLevelSet();	
} 

void BeamLevelSet::createLevelSet(){
	updateLevelSetBeam(deflections);
	//outputLevelSet("BeamLS1");	
}

//this function defines the type of beam. i.e. horizonal vertical etc
//void setupBeam(){
//	// need the number of points
//	// this function defines the position of the beam
//	
//	oldMidPoints 
//	for(
//}

vec2 BeamLevelSet::getBeamBase(){
	vec2 base(beamX, beamY);
	return base;
}

void BeamLevelSet::updateLevelSetBeam(vector<double> deflections){
	int bCs = Grid::bCs;
	int i, j, k;
	double midPt, newPt, oldPt; //points in the direction that is changing
//	double yStep = midPoints[1].y_() - midPoints[0].y_(); 
//	double xStep = midPoints
	//vec2 bdPt(beamX, -yStep);
	//cout << "beamX " << beamX << endl;
	vec2 oldPoint(beamX, beamY); // the start point of the beam
	vector<vec2>segmentPts;
	segmentPts.push_back(oldPoint);		
	//step, theta, angle
	double xPoint, yPoint, xStep, yStep, pDefl;
	xStep = step * cos(theta);
	yStep = step * sin(theta);

	cout << yStep << " " << step << " " << theta << endl;
	oldPt = 0;
	
	for(i = 0; i < deflections.size(); i++){
		pDefl = deflections[i]; //negative to right and down
		//cout << "Deflection " << pDefl << " Theta " << theta << endl;		
		xPoint = beamX + xStep * (i+1);
		yPoint = beamY + yStep * (i+1);
		xPoint += -pDefl * cos(PI/2 - theta);
		yPoint += pDefl * sin(PI/2 - theta);		
		vec2 newPoint(xPoint, yPoint);		
		segmentPts.push_back(newPoint);
	}

	//SWEEPING METHOD
//	for(int i = 0; i < segmentPts.size(); i++){
//		cout << "newPoint" << endl;
//		cout << segmentPts[i].x_() << endl;
//	}

			

//	for(i = 0; i < segmentPts.size(); i++){
//		vec2 sPoint = segmentPts[i];
//		double mPoint = deflections[i];  
//		cout<< "Segment " << endl;
//		cout << "x " << sPoint.x_() << " y " << sPoint.y_() << endl;
//		cout<< "MidPoint " << endl;
//		cout << "deflection " << deflections[i] << endl;
//	}	
	//now determine distance
	//to be modified
	
//	// construct a box around each beam segment. 
//	double distV, distW, totalD, min_dist = 1000., x, y;	
//	vec2 segPt1, segPt2;
//	double x1, y1, x2, y2;
//	double x, y; //each point within square segment
//	int cellX1, cellY1, cellX2, cellY2, cellDiff;
//	for(int i = 0; i < segmentPts.size() - 1; i++){
//		segPt1 = segmentPts[i]; 
//		segPt2 = segmentPts[i+1];
//		x1 = segPt1.x_() - h; 
//		y1 = segPt1.y_() - h;
//		x2 = segPt2.x_() + h;
//		y2 = segPt2.y_() + h;
//		cellX1 = (x1 - 0.5 * dX)/dX + bCs;
//		cellX2 = (x2 - 0.5 * dX)/dX + bCs;
//		cellY1 = (y1 - 0.5 * dY)/dY + bCs;
//		cellY2 = (y2 - 0.5 * dY)/dY + bCs;
//		cellDX = cellX2 - cellX1; 
//		cellDY = cellY2 - cellY1;	
//		for(int j = cellX1; j < cellDX; j++)
//			for(int k = cellY1; k < cellDY; k++){
//				x = -dX * bCs + dX * j + dX/2;
//				y = -dY * bCs + dY * k + dY/2;
//				vec2 point(x, y);
//				//calculate minimum distance to line segment
//				
//				minDist
//				levelSet[i][j] = minimumDistance(v_c, w_c, point);	
//			}
//	
//				
//	
	vec2 v, w, v_c, w_c;
	int closest; 
	double distV, distW, totalD, min_dist = 1000., x, y;	
	for(i = 0; i < NX; i++){
		for(j = 0; j < NY; j++){
			x = -dX * bCs + dX * i + dX/2;
			y = -dY * bCs + dY * j + dY/2;
			vec2 point(x, y);
			//find the closest two points
			for(k = 0; k < segmentPts.size() - 1; k++){
				v = segmentPts[k];
				w = segmentPts[k+1];
				distV = lengthSquared(v, point);
				distW = lengthSquared(w, point);
				totalD = distV + distW;
 				if(totalD < min_dist){//save closest two pts
					v_c = v;
					w_c = w;	
					min_dist = totalD;	
					closest = k;
				}
			}						
			min_dist = 1000.;
			//populate levelSet
			levelSet[i][j] = minimumDistance(v_c, w_c, point);		
		}
	}
	//outputLevelSet("beamLS2.dat");
	//outputToFileLevelSet2D("../Output/beamLevelSet.dat");
	//cout << " levelSet Populated, calculate Normals " << endl;
	calculateNormals();
	
}

RigidLevelSet::RigidLevelSet(Grid g):LevelSet(g){}

void RigidLevelSet::createRigidLS(vector<vector<double> > ls){
	levelSet = ls;
	calculateNormals(); 
	outputLevelSet("Rigid.dat");
}

//Rigid level sets;
//lower left position
std::vector<std::vector<double> > RigidLevelSet::createRectangleLevelSet(double sX, double sY, double w, double h){
	
	double startX = sX;
	double startY = sY;
	double width = w;
	double height = h;
	//define four lines
	vector<vec2> points;
	vec2 Point11(startX, startY);
	double x, y;
	double x_11 = Point11.x_(), y_11 = Point11.y_();
	double x_22 = x_11 + width, y_22 = y_11 + height; 
	vec2 Point12(x_11, y_11 + height);
	vec2 Point22(x_11 + width, y_11 + height);
	vec2 Point21(x_11 + width, y_11);

	cout << Point11 << " " << Point12 << " " << Point22 << " " << Point21 << " " << endl;
	points.push_back(Point11);
	points.push_back(Point12);
	points.push_back(Point22);
	points.push_back(Point21);
	double d11, d12, d23, d40;
	double dist;	
	int m;
	for(int i = 0; i < NX; i++){
		for(int j = 0; j < NY; j++){
			x = -dX * bCs + dX * i + dX/2;
			y = -dY * bCs + dY * j + dY/2;	
			//calculate distance to nearest line
			dist = 1000.;
			vec2 point(x,y);	
			for(int k = 0; k < 4; k++){
				m = k+1;
				if(m == 4)
					m = 0;
				double d = minimumDistance(points[k], points[m], point);			
				if(d < dist)
					dist = d;
			}
			if((x > x_11) && (y > y_11) && (x < x_22) && (y < y_22))
				levelSet[i][j] = dist;
			else
				levelSet[i][j] = -dist;			
		}
	}
	return levelSet;	
	//outputLevelSet("RectangleLS.dat");
}

//both supports are the same height and are positioned along the same y coordinate
std::vector<std::vector<double> > RigidLevelSet::createSupportLevelSet( double sX, double sY, double Rw, double Rh, double g){
	double startX = sX;
	double startY = sY;
	double width = Rw;
	double height = Rh;
	double gap = g;
	vector<vec2> points1;
	vector<vec2> points2;

	vec2 Point1_11(startX, startY);
	vec2 Point2_11(startX + gap, startY);
	double x, y;
	double x1_1 = Point1_11.x_(), y1_1 = Point1_11.y_();
	double x1_2 = x1_1 + width, y1_2 = y1_1 + height;

	vec2 Point1_12(x1_1, y1_2);
	vec2 Point1_22(x1_2, y1_2);
	vec2 Point1_21(x1_2, y1_1);
	
	//second support

	double x2_1 = Point2_11.x_(), y2_1 = y1_1;
	double x2_2 = x1_2 + gap, y2_2 = y1_2;
	
	vec2 Point2_12(x2_1, y2_2);
	vec2 Point2_22(x2_2, y2_2);
	vec2 Point2_21(x2_2, y2_1);
	cout << Point2_11 << " " << Point2_12 << " " << Point2_22 << " " << Point2_21 << endl;
	points1.push_back(Point1_11);
	points1.push_back(Point1_12);
	points1.push_back(Point1_22);
	points1.push_back(Point1_21);

	points2.push_back(Point2_11);
	points2.push_back(Point2_12);
	points2.push_back(Point2_22);
	points2.push_back(Point2_21);

	double d11, d12, d23, d40;
	double dist;	
	int m;
	bool two = false;
	for(int i = 0; i < NX; i++){
		x = -dX * bCs + dX * i + dX/2;
		for(int j = 0; j < NY; j++){			
			y = -dY * bCs + dY * j + dY/2;	
			//calculate distance to nearest line
			dist = 1000.;
			vec2 point(x,y);	
			for(int k = 0; k < 4; k++){
				m = k+1;
				if(m == 4)
					m = 0;
				double d = minimumDistance(points1[k], points1[m], point);						
				if(d < dist)
					dist = d;
			}
			for(int k = 0; k < 4; k++){
				m = k+1;
				if(m == 4)
					m = 0;
				double d = minimumDistance(points2[k], points2[m], point);						
				if(d < dist){
					dist = d;
					two = true; //closest to 2
				}
			}
			if(two){
				if((x > x2_1) && (y > y2_1) && (x < x2_2) && (y < y2_2))
					levelSet[i][j] = dist;	
				else
					levelSet[i][j] = -dist;				
			}
			else{
				if((x > x1_1) && (y > y1_1) && (x < x1_2) && (y < y1_2))
					levelSet[i][j] = dist;
				else
					levelSet[i][j] = -dist;			
			}
			two = false;
		}
	}
	return levelSet;
}

std::vector<std::vector<double> > RigidLevelSet::createCircleLevelSet(double posX, double posY, double r){
	double centreX = posX;
	double centreY = posY;
	double radius = r;
	double x, y;	
	for(int i = 0; i < NX; i++){
		x = -dX * bCs + dX * i + dX/2;
		for(int j = 0; j < NY; j++){			
			y = -dY * bCs + dY * j + dY/2;
			double result = sqrt((x - centreX)*(x - centreX) + (y - centreY)*(y - centreY)) - radius;
			levelSet[i][j] = -result;
		}
	}	
	return levelSet;
	//outputLevelSet("CircleLS.dat");
}	


//int main(int argc, char* argv[])
//{	
//	//Grid grid(500, 100, 0., 0.4, 0., 0.08, true, true, true, true);
//	//CircleLevelSet* circle = new CircleLevelSet(grid, 0.2, 0.04, 0.02);
//	
//}

////double d2 = minimumDistance(points2[k], points2[m], point);	

//int main(int argc, char* argv[])
//{	
//	Grid grid(500, 100, 0., 0.4, 0., 0.08, true, true, true, true);
//	double h = 2*(grid.dX); //interpolation width - not width of beam
//	double beamH = 0.05;
//	BeamSolver* beam = new BeamSolver(20, 0.001, beamH);	
//	beam->setup();
//	beam->initialize();
//	vector<double> deflectionsMid;
//	deflectionsMid = beam->getNodeDeflections();	
//	double step = beam->dist();
//	//double beamPosX = 0.1496, beamPosY = 0.02; 
//	double beamPosX = 0.2, beamPosY = 0.04;
//	//Grid grid, double xPos, double yPos, vector<double> deflect, bool orient, double step
//	BeamLevelSet* beamLS;
//	beamLS = new BeamLevelSet(grid, beamPosX, beamPosY, deflectionsMid, false, step);
//	beamLS->outputLevelSet("BeamLS.dat");
//	//SupportLevelSet rec(grid, 0.008, 0.04, 0.008, 0.008, 0.2);	
//	//rec.outputLevelSet("RectangleLS.dat");
//}


	
