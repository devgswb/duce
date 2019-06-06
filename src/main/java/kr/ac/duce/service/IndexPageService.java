package kr.ac.duce.service;

import kr.ac.duce.model.ProjectBoardViewModel;

import java.util.List;

public interface IndexPageService {
    List<ProjectBoardViewModel> getSampleProject(int number);
}
