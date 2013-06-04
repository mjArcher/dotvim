#ifndef LEVELSET_H
#define LEVELSET_H
//=================================================================================================
//Class: LevelSet (Abstract)
// Abstract class containing single virtual function 
// Inheriting levelSet classes - Beam, & Bluff bodies
// 
//=================================================================================================
#include <stdio.h>
#include <stdlib.h>
#include <fstream>
#include <sstream>
#include <string>
#include <vector> 
#include "../vec2.h"
#include "Grid.h"
#include "../Beam/BeamSolver.h"
#define PI 3.14159265

class LevelSet{
	public:
		//default
		LevelSet();
		~LevelSet();
		LevelSet(Grid); //domainX, domainY, posX, posY, dX, dY
		void createLevelSet();
		void outputLevelSet(std::string);
		void outputToFileLevelSet2D(std::string);
		//operator overloads
		double operator()(int, int);
		double nx_(int i, int j);	
		double ny_(int i, int j);		
	protected:
		int bCs;
		
		std::vector<std::vector<double> > levelSet, nx, ny;
		int xCells, yCells, NX, NY;		
		double dX, dY; //need to assign somehow
		void calculateNormals();
};

inline double LevelSet::operator()(int i, int j){
	return levelSet[i][j];
}

inline double LevelSet::nx_(int i, int j){
	return nx[i][j];
}

inline double LevelSet::ny_(int i, int j){
	return ny[i][j];
}


class RigidLevelSet: public LevelSet
{
	public:
		RigidLevelSet(Grid);
		void createRigidLS(std::vector<std::vector<double> >);
		std::vector<std::vector<double> > createRectangleLevelSet(double sX, double sY, double w, double h);
		std::vector<std::vector<double> > createCircleLevelSet(double posX, double posY, double r);
		std::vector<std::vector<double> > createSupportLevelSet(double sX, double sY, double Rw, double Rh, double g);		
};


//posX, posY specifies position of beam base
class BeamLevelSet: public LevelSet
{
	public:
		BeamLevelSet(Grid, double, double, BeamSolver* beam, double theta); //vec2 midPoints
		BeamLevelSet();
		void updateLevelSetBeam(std::vector<double> deflections);
		void createLevelSet();
		vec2 getBeamBase();
		bool getBeamOrientation();
	private:
		double beamX, beamY, step;
		double theta; 		
		std::vector<double> deflections; 	
		BeamSolver* beamSolver;
		std::vector<vec2> oldMidPoints;
		
};

#endif
