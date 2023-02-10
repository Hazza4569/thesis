{
  gROOT->ProcessLine(".L AtlasStyle.C");
  gROOT->ProcessLine("SetAtlasStyle()");	
  TGraph* WordCount = new TGraph("wordCountHistory");
  TCanvas* c1 = new TCanvas("","",800,600);
  c1->SetLogx(0);
  c1->SetLogy(0);
  WordCount->SetLineWidth(3);
  WordCount->SetLineColor(kRed);
  WordCount->SetMarkerSize(0);
  WordCount->Draw("apl"); 
  WordCount->GetXaxis()->SetTimeDisplay(1); 
  WordCount->GetXaxis()->SetNdivisions(-503); 
  WordCount->GetXaxis()->SetTimeFormat("%Y-%m-%d"); 
  WordCount->GetXaxis()->LabelsOption("h"); 
  WordCount->GetXaxis()->SetTimeOffset(0,"gmt"); 
  WordCount->GetYaxis()->SetTitle("Word Count"); 
  c1->Print("wordCount.pdf");
}
